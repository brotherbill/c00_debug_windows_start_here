import std.stdio : writeln;

int add(int left, int right)
{
	int sum = left + right;
	return sum;
}

void main()
{
	int first  = 20;
	int second = 22;
	int total  = add(first, second);

	writeln("first  = ", first);
	writeln("second = ", second);
	writeln("total  = ", total);
}
