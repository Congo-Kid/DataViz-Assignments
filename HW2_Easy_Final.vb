Sub Stock_Analysis()


    For Each ws In ActiveWorkbook.Worksheets
    
        'make sheets active
        ws.Activate
    
    
        'hard code headers for ticker and total stock volume.
        ws.Cells(1, 9).Value = "Ticker"
        ws.Cells(1, 10).Value = "Total Stock Volume"
   
    
        'keep track of location for each ticker symbol
        Dim Summary_Table_Row As Integer
        Summary_Table_Row = 2
        'set variables for last row and worksheet name
        Dim LastRow As Long
        Dim WorksheetName As String
        
        'define variable for column position
        Dim Column As Integer
        Column = 1
        
        'grab WorksheetName
        WorksheetName = ws.Name

        ' Determine the Last Row
        LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
        
        
                'Start for loop for ticker symbol (column A)
                For i = 2 To LastRow
        
                    'check if we're still within the same ticker symbol
                    If Cells(i + 1, Column).Value <> Cells(i, Column).Value Then
            
                        'Display ticker
                        Ticker = Cells(i, Column).Value
                        'Display stock volume
                        Total_Stock_Volume = Total_Stock_Volume + Cells(i, Column + 6).Value
                        
                        'print stock ticker and volume
                        Range("I" & Summary_Table_Row).Value = Ticker
                        Range("J" & Summary_Table_Row).Value = Total_Stock_Volume
                
                        'Add to summary table row
                        Summary_Table_Row = Summary_Table_Row + 1
                
                        'Reset stock volume
                        Total_Stock_Volume = 0
                
                            'Otherwise if cell after row is same...
                            Else
            
                        'add to stock volume
                        Total_Stock_Volume = Total_Stock_Volume + Cells(i, Column + 6).Value
                        
                        
                
                    End If
        
                Next i
                
              
    Next ws

End Sub

