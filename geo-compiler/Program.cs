using GEO;

string filePath = Environment.GetCommandLineArgs()[1];

Dictionary<string, string> instructions = Enum.GetValues(typeof(Instruction))
    .Cast<Instruction>()
    .ToDictionary(
        t => t.ToString(), 
        t => ((int) t).ToBinaryString(10)
    );

Dictionary<string, string> registers = Enum.GetValues(typeof(Register))
    .Cast<Register>()
    .ToDictionary(
        t => t.ToString(),
        t => ((int) t).ToBinaryString(3)
    );
Dictionary<string, int> tags = new Dictionary<string, int>();


string Jump(string instruction, string flag)
{
    return $"{instructions[instruction]}{tags[flag].ToBinaryString(17)}";
}

string Immediate(string instruction, string outputReg, string reg1, string immediate)
{
    string ins = instructions[instruction];
    string in1 = registers[reg1];
    string outReg = registers[outputReg];
    string imm = Convert.ToInt32(immediate).ToBinaryString(11);

    return $"{ins}{in1}{outReg}{imm}";
}
string NoImmediate(string instruction, string outputReg, string reg1, string reg2)
{
    string ins = instructions[instruction];
    string in1 = registers[reg1];
    string outReg = registers[outputReg];
    string in2 = registers[reg2];

    return $"{ins}{in1}{outReg}{0.ToBinaryString(8)}{in2}";
}

string outputFile = $"{Directory.GetCurrentDirectory()}/out.mem";
string[] inLines = File.ReadAllLines(filePath);


List<string> instructionList = new List<string>();

int lineNumber = 0;
foreach (string line in inLines)
{
    if (String.IsNullOrEmpty(line))
        Console.WriteLine(line);
    else if(line.EndsWith(':'))
        tags.Add(line.Split(":")[0], lineNumber);
    else
    {
        instructionList.Add(line);
        lineNumber++;
    }
}

string[] outLines = instructionList.Select(line => {
    var instruction = line.Split(' ');

    if (instruction.Length < 3)
        return Jump(instruction[0], instruction[1]);
    else if (int.TryParse(instruction[3], out int n))
        return Immediate(instruction[0], instruction[1], instruction[2], instruction[3]);
    else
        return NoImmediate(instruction[0], instruction[1], instruction[2], instruction[3]);
}).ToArray();

File.WriteAllLines(outputFile, outLines);