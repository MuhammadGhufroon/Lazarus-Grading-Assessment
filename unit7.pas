unit unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    HitungNilai: TButton;
    Nama: TEdit;
    Nilai: TEdit;
    Output: TMemo;
    LabelNama: TLabel;
    LabelNilai: TLabel;
    procedure HitungNilaiClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure HitungGrade(Nilai: Real; var Grade: Char; var Warna: TColor);
begin
  if Nilai >= 85 then
  begin
    Grade := 'A';
    Warna := clGreen;
  end
  else if Nilai >= 75 then
  begin
    Grade := 'B';
    Warna := clGreen;
  end
  else if Nilai >= 60 then
  begin
    Grade := 'C';
    Warna := clYellow;
  end
  else if Nilai >= 45 then
  begin
    Grade := 'D';
    Warna := clYellow;
  end
  else
  begin
    Grade := 'E';
    Warna := clRed;
  end;
end;

procedure TForm1.HitungNilaiClick(Sender: TObject);
var
  NilaiInput: Real;
  Grade: Char;
  Warna: TColor;
  Status: string;
  GradeStart: Integer;
begin

  Output.Clear;

  Grade := ' ';
  Warna := clNone;

  NilaiInput := StrToFloatDef(Nilai.Text, 0.0);

  HitungGrade(NilaiInput, Grade, Warna);

  if NilaiInput > 70 then
    Status := 'Lulus'
  else
    Status := 'Tidak Lulus';

  Output.Lines.Add('Status Kelulusan:');
  Output.Font.Color := clWhite;
  Output.Lines.Add(Status);
  Output.Lines.Add('Grade: ');

  Output.Font.Color := Warna;

  GradeStart := Output.GetTextLen;

  Output.Lines.Add(Grade);

  Output.SelStart := GradeStart;
  Output.SelLength := Length(Grade);
  Output.Font.Size := 16;

end;




end.

