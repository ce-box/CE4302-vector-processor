using System.Drawing;

string path = "";
string outputName = "out.img";

foreach (var arg in Environment.GetCommandLineArgs().Select((value, i) => new { i, value }))
{
    if(arg.i == 1)
        path = arg.value;
    else if(arg.value == "-o")
    {
        string outName = Environment.GetCommandLineArgs()[arg.i + 1];
        if(outName.EndsWith("img"))
            outputName = outName;
        else
            outputName = $"{outName}.img";
    }
        
}

if (String.IsNullOrEmpty(path))
    throw new Exception("A path must be specified");

const int MaxValue = Byte.MaxValue + 1;

int length = MaxValue * MaxValue * 3;
Bitmap image = new Bitmap(path);
byte[] imgMatrix = new byte[length];

Console.WriteLine("Converting image to Byte Array...");

for (int i = 0; i < MaxValue; i++)
    for (int j = 0; j < MaxValue; j++)
    {
        Color pixel = image.GetPixel(j, i);
        int position = MaxValue * j + i;
        
        int rPos = MaxValue * MaxValue * 0 + position;
        int gPos = MaxValue * MaxValue * 1 + position;
        int bPos = MaxValue * MaxValue * 2 + position;

        imgMatrix[rPos] = pixel.R;
        imgMatrix[gPos] = pixel.G;
        imgMatrix[bPos] = pixel.B;

        Console.WriteLine($"<[{rPos}]:{pixel.R},[{gPos}]:{pixel.G},[{bPos}]:{pixel.B}>");
    }

string values = "";

Console.WriteLine("Converting color values to text...");
using ProgressBar progress = new ProgressBar();
for (int i = 1; i <= length; i++)
{
    values += imgMatrix[i - 1].ToString();
    
    bool isEndOfLine = i % MaxValue == 0;

    if(isEndOfLine)
        values += "\n";
    else
        values += " ";

    progress.Report((double) (i + 1) / length);
}

Console.WriteLine();
Console.WriteLine("Writing file...");
await File.WriteAllTextAsync($"./out/{outputName}", values);
Console.WriteLine("Enjoy your new Image!");


        
