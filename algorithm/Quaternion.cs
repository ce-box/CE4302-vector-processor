using System.Drawing;

public class Quaternion
{
    public byte A { get; set; }
    public byte R { get; set; }
    public byte G { get; set; }
    public byte B { get; set; }

    public Color ToColor()
    =>  Color.FromArgb(this.A, this.R, this.G, this.B);

    public static Quaternion FromColor(Color pixel)
    => new Quaternion{ A = pixel.A, R = pixel.R, G = pixel.G, B = pixel.B };
}
