program laba_4_p2;

{$APPTYPE CONSOLE}

type
  TArr = array of char;

var
  Arr: TArr;
  j, n, k: integer;
  count: int64;

procedure Tower(Stat: integer; left, right, temp: char);
begin
  if Stat > 0 then
  begin
    Tower(Stat - 1, left, temp, right);
    writeln(left, ' -> ', right);
    Tower(Stat - 1, temp, right, left);
  end;
end;

procedure generate(l, r: integer; var Arr: TArr; var count: int64);
var
  i: integer;
  v: char;
begin
  if l = r then
  begin
    for i := 1 to k do
      write(Arr[i], ' ');
    writeln;
    inc(count);
  end
  else
  begin
    for i := l to r do
    begin
      v := Arr[l];
      Arr[l] := Arr[i];
      Arr[i] := v;
      generate(l + 1, r, Arr, count);
      v := Arr[l];
      Arr[l] := Arr[i];
      Arr[i] := v;
    end;
  end;
end;

begin
  write('Enter levels count: ');
  readln(n);
  Tower(n, '1', '3', '2');

  count := 0;
  write('Enter letters count: ');
  readln(k);
  SetLength(Arr, k);
  writeln('Enter:');
  for j := 1 to k do
    readln(Arr[j]);
  generate(1, k, Arr, count);
  writeln('count=', count);
  readln;
end.

