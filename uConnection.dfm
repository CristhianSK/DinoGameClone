object dbConnection: TdbConnection
  OldCreateOrder = False
  Height = 414
  Width = 536
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=root'
      'Database=DinoGame'
      'DriverID=PG')
    Left = 400
    Top = 336
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\User\Downloads\lib\lib\libpq.dll'
    Left = 392
    Top = 208
  end
  object FDQuery: TFDQuery
    Connection = FDConnection1
    Left = 312
    Top = 304
  end
end
