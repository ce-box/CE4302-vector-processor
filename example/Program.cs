using System.Drawing;

Quaternion[,] ApplyFiler(Quaternion[,] pixels, Filter filter)
{
    switch (filter)
    {
        case Filter.SEPIA:
            return pixels.Select(pixel => Sepia(pixel));
        case Filter.GRAY:
            return pixels.Select(pixel => Grey(pixel));
        case Filter.NEGATIVE:
            return pixels.Select(pixel => Negative(pixel));
        default:
            return pixels;
    }
}

Quaternion Sepia(Quaternion input)
{   
    short r = (short) ((input.R / 3) + (input.G) + (input.B / 5));
    short g = (short) ((input.R / 3) + (input.G) + (input.B / 6));
    short b = (short) ((input.R / 4) + (input.G / 2) + (input.B / 8));

    return new Quaternion
    {
        A = input.A,
        R = r < Byte.MaxValue ? (byte) r : Byte.MaxValue,
        G = g < Byte.MaxValue ? (byte) g : Byte.MaxValue,
        B = b < Byte.MaxValue ? (byte) b : Byte.MaxValue,
    };
}

Quaternion Grey(Quaternion input)
{
    byte average = (byte)(input.R/3 + input.G/3 + input.B/3);
    return new Quaternion
    {
        A = input.A,
        R = average,
        G = average,
        B = average,
    };
}

Quaternion Negative(Quaternion input)
    => new Quaternion
    {
        A = input.A,
        R = (byte)(Byte.MaxValue - input.R),
        G = (byte)(Byte.MaxValue - input.G),
        B = (byte)(Byte.MaxValue - input.B),
    };

// Not In Code

Quaternion[,] GetImageValue(string name)
{
    Bitmap image = new Bitmap($"./images/{name}.png");
    Quaternion[,] pixels = new Quaternion[Byte.MaxValue, Byte.MaxValue];
    for (byte i = 0; i < Byte.MaxValue; i++)
        for (byte j = 0; j < Byte.MaxValue; j++)
            pixels[i, j] = Quaternion.FromColor(image.GetPixel(i, j));

    return pixels;
}

void SetImage(string name, Quaternion[,] pixels)
{
    Bitmap image = new Bitmap(Byte.MaxValue, Byte.MaxValue);
    for (byte i = 0; i < Byte.MaxValue; i++)
        for (byte j = 0; j < Byte.MaxValue; j++)
            image.SetPixel(i, j, pixels[i, j].ToColor());
    image.Save($"./images/{name}.png");
}

var values = GetImageValue("example");

SetImage("sepia", ApplyFiler(values, Filter.SEPIA));
SetImage("gray", ApplyFiler(values, Filter.GRAY));
SetImage("negative", ApplyFiler(values, Filter.NEGATIVE));
