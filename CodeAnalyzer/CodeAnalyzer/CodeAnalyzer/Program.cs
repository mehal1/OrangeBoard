using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CodeAnalyzer
{
    class Program
    {
        static string pollingDir = @"E:\courses\sharath files\OrangeBoard\OrangeBoard\OrangeBoard\assignment1";
        static string tempDir = "C:/CodeAnalyzer/Temp";
        static string processedDir = "C:/CodeAnalyzer/Processed";
        static string processingDir = "C:/CodeAnalyzer/Staging";
        static string codeAnalysisExe = "C:/CodeAnalyzer/CodeAnalyzer.exe";
        static int pollingTimeSecs = 5;
        static List<string> allowedExts = new List<string> { ".cs", ".c", ".cpp", ".zip" };

        static List<string> GetSupportedFiles(string directory,
            List<string> allowedExts,
            SearchOption searchOption)
        {
            List<string> files = new List<string>();
            string[] _files = Directory.GetFiles(directory, "*.*", searchOption);
            foreach(string file in _files)
                if (allowedExts.Contains(Path.GetExtension(file).ToLower()))
                    files.Add(file);
            return files;
        }

        static void Process(string file)
        {
            string ext = Path.GetExtension(file).ToLower();
            StringBuilder codeAnalysisArg = new StringBuilder(" ");
            if (String.Equals(ext, ".zip"))
            {
                string extractDir = Path.Combine(tempDir, Path.GetFileNameWithoutExtension(file));
                if (Directory.Exists(extractDir))
                    Directory.Delete(extractDir, true);
                ZipFile.ExtractToDirectory(file, extractDir);
                codeAnalysisArg.Append(extractDir);
                codeAnalysisArg.Append(" *.cs *.cpp *.h");
            } else
            {
                codeAnalysisArg.Append(Path.GetDirectoryName(file));
                codeAnalysisArg.Append(" ");
                codeAnalysisArg.Append(Path.GetFileName(file));
            }

            Process runCodeAnalysis = new Process
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = "cmd.exe",
                    Arguments = "/c "+codeAnalysisExe+codeAnalysisArg.ToString()+" /m",
                    UseShellExecute = false,
                    RedirectStandardOutput = true,
                    CreateNoWindow = true
                }
            };

            runCodeAnalysis.Start();
            string codeAnalysisOutput = runCodeAnalysis.StandardOutput.ReadToEnd();

            UpdateScore(file, codeAnalysisOutput);

            File.Move(file, Path.Combine(processedDir, Path.GetFileName(file)));
        }

        private static void UpdateScore(string file, string codeAnalysisOutput)
        {
            long numLines = countLines(codeAnalysisOutput);
            long score;

            //Perfect Code gives you 14 lines
            //No valid code gives you less 14 lines
            //More than 14 lines gives number of inperfect functions
            long imperfectFunct = numLines - 14;

            if (imperfectFunct < 0)
                score = 0;
            else if (imperfectFunct == 0)
                score = 100;
            else if (imperfectFunct > 0 && imperfectFunct <= 10)
                score = 100 - imperfectFunct;
            else
                score = 100 - 25;

            Console.WriteLine("File was: " + file + " & grade is: "+ score);

        }

        private static long countLines(string data)
        {
            long count = 1;
            int start = 0;
            while ((start = data.IndexOf('\n', start)) != -1)
            {
                count++;
                start++;
            }
            return count;
        }

        static void Main(string[] args)
        {
            List<string> previousFiles = GetSupportedFiles(pollingDir, allowedExts, SearchOption.TopDirectoryOnly);

            while(true)
            {
                List<string> currentFiles = GetSupportedFiles(pollingDir, allowedExts, SearchOption.TopDirectoryOnly);
                IEnumerable<string> newFiles = currentFiles.Except(previousFiles);

                foreach(string file in newFiles)
                {
                    string newFile = Path.Combine(processingDir, Path.GetFileName(file));
                    File.Copy(file, newFile);
                    Process(newFile);
                }

                previousFiles = currentFiles;
                Thread.Sleep(pollingTimeSecs * 1000);
            }
            
        }
    }
}
