using System.Drawing;

public static class Extensions
{
    public static Quaternion[,] Select(this Quaternion[,] pixels, Func<Quaternion, Quaternion> action)
    {
        Quaternion [,] newPixels = new Quaternion[Byte.MaxValue, Byte.MaxValue];
        for (byte i = 0; i < Byte.MaxValue; i++)
            for (byte j = 0; j < Byte.MaxValue; j++)
                newPixels[i, j] = action(pixels[i, j]);
        return newPixels;
    }

}
