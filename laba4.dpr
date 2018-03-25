program laba4;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const   N=2000;

type TArray=array[1..N] of Integer;

   var shella,sheika,main,qsorta: TArray; k,i,p: Integer;
   SheikerComparisons,SheikerPermutations,ShellComparisons,ShellPermutations,qSortComparisons,qSortPermutations: Integer;


  procedure NewMass(var arr, intarr: TArray; Size : Integer);
  var i: Integer;
   begin
      for i:=1 to size do
       arr[i]:=intarr[i];
   end;

   procedure Swap(var arr: TArray; var e1,e2: Integer);
   var temp: Integer;
    begin
      temp:=arr[e1];
      arr[e1]:=arr[e2];
      arr[e2]:=temp;
    end;

    procedure ShakerSort(var Size,Sravn,perest: integer);
     var  l,r,kek,kek1,s,s1,j: integer;
   begin
   L:=2; perest:=0; sravn:=0;
   R:=size;
    while L<=R  do
    begin
     for j:=R downto L do
      begin
         if SheikA[j-1]>SheikA[j] then
          begin
            kek:=j-1;
            s:=j;
            swap(SheikA,kek,s);
            inc(perest);
            inc(sravn);
          end
           else inc(sravn);
          end;
          L:=L+1;
          for j:=L to R do
           begin
              If SheikA[j-1]>SheikA[j] then
               begin
                   kek1:=j-1;
                   s1:=j;
                   swap(SheikA,kek1,s1);
                   inc(perest);
                   inc(sravn);
               end
               else inc(sravn);
           end;
           R:=R-1;
          end;
      end;

  procedure ShellSort(var Size, Sravn, Perest: integer);
   var t,i,k,j,tmp,m:integer;
    begin
     Sravn:=0;
     Perest:= 0;
      t := Trunc(Ln(Size) / Ln(2)) - 1;
      for i:=1 to t do
      begin
          k:= (1 shl (t+1-i)) - 1;
           for j:=(k + 1) to Size do
            begin
      tmp:=ShellA[j];
      m:=j-k;
      While((m>=1) and (ShellA[m] > tmp)) do
      begin
        ShellA[M+k] := ShellA[m];
        m:=m-k;
        Inc(Sravn);
        Inc(Perest);
      end;
      ShellA[m+k] := tmp;
      {Inc(Perest);}
      Inc(Sravn);
    end;
  end;
end;

procedure QSort(const size: integer; var Comp,Perm: integer);
Procedure QSort(Left,Right: Integer);
var
  I,J,opornii:Integer;
begin
  I:=Left;
  J:=Right;
  opornii:=qsorta[(Left+Right) div 2];
  repeat
    while qsorta[I]<opornii do  begin Inc (I); inc(comp); end;
    while qsorta[J]>opornii do  begin Dec (J); Inc(Comp); end;
    if I<=J then
    begin
      swap(qsorta,i,j);
      Inc(Perm);
      Inc (I);
      Dec (J);
    end;
  until I>J;
  if J>Left then  QSort(Left,J);
  if I<Right then QSort(I,Right);
end;
begin
  QSort (0,size);
end;

procedure reverse(var A12: TArray; max: Integer);
var i,j,tmp:integer;
begin
j:=max;
for i:=1 to (max div 2) do
begin 
tmp:=A12[i];
A12[i]:=A12[j];
A12[j]:=tmp;
dec(j); 
end; 
end;

procedure CreateTableRow(const k:integer; rtype:string; var SheC, SheP, ShC, ShP, qSC, qSP: Integer);
begin
  Writeln('|',k:4,' el. |', '':15,'|', '':15,'|', '':15,'|', '':15,'|', '':15,'|', '':15,'|');
  Writeln('|',rtype:9,'|',SheC:10,'':5, '|',SheP:10,'':5, '|',ShC:10,'':5, '|',ShP:10,'':5, '|',qSC:10,'':5, '|',qsP:10,'':5, '|');
  Writeln('+---------+---------------+---------------+---------------+---------------+---------------+---------------+');
end;


begin
  Randomize;
  for i:=1 to N do Main[i] := Random(100) - 50;
  Writeln('+---------+-------------------------------+-------------------------------+-------------------------------+');
  Writeln('|         |       Sheiker #1              |      Shella #2                |            qSort #3           |');
  Writeln('|  Array  +---------------+---------------+---------------+---------------+---------------+---------------+');
  Writeln('|  type   |  Number of    |   Number of   |  Number of    |   Number of   |   Number of   |  Number of    |');
  Writeln('|         |  comparisons  |   exchanges   |  comparisons  |   exchanges   |  comparisons  |   exchanges   |');
  Writeln('+---------+---------------+---------------+---------------+---------------+---------------+---------------+');
     for p:=1 to 3 do
  begin

    case p of
      1 : k := 10;
      2 : k := 100;
      3 : k := 2000;
    end;
    NewMass(ShellA,Main,k);
    NewMass(SheikA,Main,k);
    NewMass(qSortA,Main,K);

     { ne otsortirivannie  }
    ShakerSort(k,SheikerComparisons,SheikerPermutations);
    ShellSort(k,ShellComparisons,ShellPermutations);
    qSortComparisons:=0;
    qSortPermutations:=0;
    qSort(k,qSortComparisons,qSortPermutations);
    CreateTableRow(k, 'unsorted' , SheikerComparisons,SheikerPermutations,ShellComparisons,ShellPermutations,qSortComparisons,qSortPermutations);

    { otsortirovannie  }
    ShakerSort(k,SheikerComparisons,SheikerPermutations);
    ShellSort(k,ShellComparisons,ShellPermutations);
    qSortComparisons:=0;
    qSortPermutations:=0;
    qSort(k,qSortComparisons,qSortPermutations);
    CreateTableRow(k, 'sorted  ' , SheikerComparisons,SheikerPermutations,ShellComparisons,ShellPermutations,qSortComparisons,qSortPermutations);

    { reversiruem    }
    reverse(ShellA,k);
    reverse(SheikA,k);
    reverse(qSortA,k);
    ShakerSort(k,SheikerComparisons,SheikerPermutations);
    ShellSort(k,ShellComparisons,ShellPermutations);
    qSortComparisons:=0;
    qSortPermutations:=0;
    qSort(k,qSortComparisons,qSortPermutations);
    CreateTableRow(k, 'reverse.' , SheikerComparisons,SheikerPermutations,ShellComparisons,ShellPermutations,qSortComparisons,qSortPermutations);

  end;
  Readln;
end.
