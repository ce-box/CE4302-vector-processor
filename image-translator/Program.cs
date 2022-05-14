using System.Drawing;
using System.Linq;

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

int lenght = Byte.MaxValue * Byte.MaxValue * 3;
Bitmap image = new Bitmap(path);
byte[] imgMatrix = new byte[lenght];

Console.WriteLine("Converting image to Byte Array...");

for (byte i = 0; i < Byte.MaxValue; i++)
    for (byte j = 0; j < Byte.MaxValue; j++)
    {
        Color pixel = image.GetPixel(j, i);
        int position = Byte.MaxValue * j + i;
        
        imgMatrix[Byte.MaxValue * 0 + position] = pixel.R;
        imgMatrix[Byte.MaxValue * 1 + position] = pixel.G;
        imgMatrix[Byte.MaxValue * 2 + position] = pixel.B;
    }

string values = "";

Console.WriteLine("Converting color values to text...");
for (int i = 1; i <= lenght; i++)
{
    values += imgMatrix[i - 1].ToString();
    
    bool isEndOfLine = i % (Byte.MaxValue) == 0;

    if(isEndOfLine)
        values += "\n";
    else
        values += " ";
}

Console.WriteLine("Writing file...");
await File.WriteAllTextAsync($"./out/{outputName}", values);
Console.WriteLine("Enjoy your new Image!");


        
