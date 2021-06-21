{ ***************************************************************************

  Copyright (c) 2016-2020 Kike P�rez

  Unit        : Quick.Core.Entity
  Description : Core Entity Rest Request
  Author      : Kike P�rez
  Version     : 1.8
  Created     : 02/11/2019
  Modified    : 07/09/2020

  This file is part of QuickCore: https://github.com/exilon/QuickCore

 ***************************************************************************

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

 *************************************************************************** }

unit Quick.Core.Entity.Request;

{$M+}

{$i QuickCore.inc}

interface

uses
  System.SysUtils;

type
  TEntityRequestAction = (raSelect, raAdd, raUpdate, raAddOrUpdate, raDelete, raCount);

  TEntityConnectRequest = class
  private
    fUser : string;
    fPassword : string;
  published
    property User : string read fUser write fUser;
    property Password : string read fPassword write fPassword;
  end;

  TEntityRequest = class abstract
  private
    fTable : string;
    fAction : TEntityRequestAction;
    fWhereClause : string;
  published
    property Table : string read fTable write fTable;
    property Action : TEntityRequestAction read fAction write fAction;
    property WhereClause : string read fWhereClause write fWhereClause;
  end;

  TEntitySelectRequest = class(TEntityRequest)
  private
    fFields : string;
    fLimit : Integer;
    fOrder : string;
    fOrderAsc : Boolean;
  published
    property Fields : string read fFields write fFields;
    property Limit : Integer read fLimit write fLimit;
    property Order : string read fOrder write fOrder;
    property OrderAsc : Boolean read fOrderAsc write fOrderAsc;
  end;

  TEntityUpdateRequest = class(TEntityRequest)
  private
    fFields : string;
    fValues : string;
  published
    property Fields : string read fFields write fFields;
    property Values : string read fValues write fValues;
  end;

  TEntityCountRequest = class(TEntityRequest);

  TEntityDeleteRequest = class(TEntityRequest);

const
  EntityRequestActionStr : array[Low(TEntityRequestAction)..High(TEntityRequestAction)] of string = ('Select','Add','Update','AddOrUpdate','Delete','Count');

implementation

end.
