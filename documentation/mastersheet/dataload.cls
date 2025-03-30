VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Arkusz2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Private Sub CommandButton1_Click()
    Dim path, car, model, final_path, int_path As String
    Dim row_counter As Integer
    Dim wb As Workbook
    Dim value As Double
    
    
    path = "\<CAR>\Cases and Data\Postprocessings\<CHASSIS>\<MODEL>\Data\<FILE>"
    car = ActiveSheet.Name
    
    path = Replace(path, "<CAR>", car)
    
    ' FIND FIRST CELL WITHOUT DF VALUE
    row_counter = 2
    Cells(2, 15).Select
    Do Until IsEmpty(ActiveCell)
        ActiveCell.Offset(1, 0).Select
        row_counter = row_counter + 1
    Loop
    
    
    Cells(row_counter, 1).Select
    
    
    ' FILL VALUES FOR ALL CASES WITHOUT VALUES
    Do Until IsEmpty(ActiveCell)
        
        model = ActiveCell.value
        int_path = Replace(path, "<CHASSIS>", Left(model, 3))
        final_path = Replace(int_path, "<MODEL>", model)
        
        final_path = ThisWorkbook.path & final_path
        
        If Len(Dir(Replace(final_path, "<FILE>", "Mean DF Monitor Plot.csv"))) <> 0 Then
            Set wb = Workbooks.Open(Replace(final_path, "<FILE>", "Mean DF Monitor Plot.csv"))
            value = 2 * Abs(wb.Sheets(1).Cells.Find("*", , xlValues, , xlByRows, xlPrevious).value)
            wb.Close
            Cells(row_counter, 15).value = value
        Else
            Cells(row_counter, 15).value = 0
        End If
        
        If Len(Dir(Replace(final_path, "<FILE>", "Mean D Monitor Plot.csv"))) <> 0 Then
            Set wb = Workbooks.Open(Replace(final_path, "<FILE>", "Mean D Monitor Plot.csv"))
            value = 2 * Abs(wb.Sheets(1).Cells.Find("*", , xlValues, , xlByRows, xlPrevious).value)
            wb.Close
            Cells(row_counter, 16).value = value
        Else
            Cells(row_counter, 16).value = 0
        End If
        
        If Len(Dir(Replace(final_path, "<FILE>", "COP X Mean Monitor Plot.csv"))) <> 0 Then
            Set wb = Workbooks.Open(Replace(final_path, "<FILE>", "COP X Mean Monitor Plot.csv"))
            value = wb.Sheets(1).Cells.Find("*", , xlValues, , xlByRows, xlPrevious).value
            wb.Close
            Cells(row_counter, 17).value = value
        Else
            Cells(row_counter, 17).value = 0
        End If
        
        If Len(Dir(Replace(final_path, "<FILE>", "Radiator Massflow Mean Plot.csv"))) <> 0 Then
            Set wb = Workbooks.Open(Replace(final_path, "<FILE>", "Radiator Massflow Mean Plot.csv"))
            value = Abs(wb.Sheets(1).Cells.Find("*", , xlValues, , xlByRows, xlPrevious).value)
            wb.Close
            Cells(row_counter, 18).value = value
        Else
            Cells(row_counter, 18).value = 0
        End If
        ActiveCell.Offset(1, 0).Select
        row_counter = row_counter + 1
    Loop
End Sub
