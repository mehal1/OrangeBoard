$('.flip').click(function(){
    $(this).find('.card').toggleClass('flipped');
});

$('#toggle').on('click' ,function(){
    $('.card').toggleClass('flipped');
});

$(document).ready(function(){
    var ctx = $("#lang").get(0).getContext("2d");
//programming languages
    var data = [

        {
            value: 100,
            color: "grey",
            highlight: "yellowgreen",
            label: "Java"
        },
        {
            value: 80,
            color: "grey",
            highlight: "yellowgreen",
            label: "C++"
        },


        {
            value: 70,
            color: "grey",
            highlight: "yellowgreen",
            label: "JavaScript"
        },
        {
            value: 100,
            color: "grey",
            highlight: "yellowgreen",
            label: "HTML"
        },
        {
            value: 70,
            color: "grey",
            highlight: "yellowgreen",
            label: "CSS"
        },
        {
            value: 50,
            color: "grey",
            highlight: "yellowgreen",
            label: "Python"
        },
    ];

    var chart = new Chart(ctx).Doughnut(data);
});

$(document).ready(function(){
    var ctx = $("#ide").get(0).getContext("2d");
//IDE
    var data = [

        {
            value: 30,
            color: "grey",
            highlight: "yellowgreen",
            label: "Eclipse"
        },
        {
            value: 40,
            color: "grey",
            highlight: "yellowgreen",
            label: "IntelliJ"
        },


        {
            value: 30,
            color: "grey",
            highlight: "yellowgreen",
            label: "Visual Studio"
        },
        {
            value: 50,
            color: "grey",
            highlight: "yellowgreen",
            label: "Android Studio"
        },
        {
            value: 40,
            color: "grey",
            highlight: "yellowgreen",
            label: "VMWare VSphere"
        },
        {
            value: 50,
            color: "grey",
            highlight: "yellowgreen",
            label: "Axure"
        },
    ];

    var chart = new Chart(ctx).Doughnut(data);
});

$(document).ready(function(){
    var ctx = $("#os").get(0).getContext("2d");
//
    var data = [

        {
            value: 270,
            color: "grey",
            highlight: "yellowgreen",
            label: "MY SQL"
        },
        {
            value: 150,
            color: "grey",
            highlight: "yellowgreen",
            label: "MS ACCESS"
        },


        {
            value: 200,
            color: "grey",
            highlight: "yellowgreen",
            label: "Mongo DB"
        },
        
        
        
    ];

    var chart = new Chart(ctx).Doughnut(data);
});

$(document).ready(function(){
    //var ctx = $("#db").get(0).getContext("2d");
    var ctx =$("#db").get(0).getContext("2d");
    var data = [

        {

            value: 100,
            color: "grey",
            highlight: "yellowgreen",
            label: "Windows"
        },
        {
            value: 80,
            color: "grey",
            highlight: "yellowgreen",
            label: "Linux"
        },


        {
            value: 80,
            color: "grey",
            highlight: "yellowgreen",
            label: "Android"
        },
        {
            value: 50,
            color: "grey",
            highlight: "yellowgreen",
            label: "JNachos"
        },
        
        {
            value: 80,
            color: "grey",
            highlight: "yellowgreen",
            label: "Unix"
        },
    ];

    var chart = new Chart(ctx).Doughnut(data);
});




Chart.pluginService.register({
    beforeDraw: function(chart) {
      var width = chart.chart.width,
          height = chart.chart.height,
          ctx = chart.chart.ctx;
  
      ctx.restore();
      var fontSize = (height / 114).toFixed(2);
      ctx.font = fontSize + "em sans-serif";
      ctx.textBaseline = "middle";
  
      var text = "75%",
          textX = Math.round((width - ctx.measureText(text).width) / 2),
          textY = height / 2;
  
      ctx.fillText(text, textX, textY);
      ctx.save();
  }  });