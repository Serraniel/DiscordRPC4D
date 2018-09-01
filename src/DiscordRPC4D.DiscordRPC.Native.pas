// ********************************************************************************************** //
// *                                         DiscordRPC4D                                       * //
// *                               Copyright (C) 2018 by Serraniel                              * //
// *                                                                                            * //
// *                          https://github.com/Serraniel/DiscordRPC4D/                        * //
// ********************************************************************************************** //

unit DiscordRPC4D.DiscordRPC.Native;

interface

type
  TDiscordRichPresence = record
    State: PAnsiChar;
    Details: PAnsiChar;
    StartTimestamp: Int64;
    EndTimestamp: Int64;
    LargeImageKey: PAnsiChar;
    LargeImageText: PAnsiChar;
    SmallImageKey: PAnsiChar;
    SmallImageText: PAnsiChar;
    PartyID: PAnsiChar;
    PartySize: Integer;
    PartyMax: Integer;
    MatchSecret: PAnsiChar;
    JoinSecret: PAnsiChar;
    SpectateSecret: PAnsiChar;
    Instance: Int8;
  end;

  PDiscordRichPresence = ^TDiscordRichPresence;

  TDicsordUser = record
    UserID: PAnsiChar;
    UserName: PAnsiChar;
    Discriminator: PAnsiChar;
    Avatar: PAnsiChar;
  end;

  PDiscordUser = ^TDicsordUser;

  TReadyCallback = procedure(const User: PDiscordUser);

  TDisconnectedCallback = procedure(ErrCode: Integer; const Msg: PAnsiChar);

  TErrorCallback = procedure(ErrCode: Integer; const Msg: PAnsiChar);

  TJoinGameCallback = procedure(const JoinSecret: PAnsiChar);

  TSpectateGameCallback = procedure(const SpectateSecret: PAnsiChar);

  TJoinRequestCallback = procedure(const Request: PDiscordUser);

  TDiscordEventHandlers = record
    ReadyCallback: TReadyCallback;
    DisconnectedCallback: TDisconnectedCallback;
    ErrorCallback: TErrorCallback;
    JoinGameCallback: TJoinGameCallback;
    SpectateGameCallback: TSpectateGameCallback;
    JoinRequestCallback: TJoinRequestCallback;
  end;

  PDiscordEventHandlers = ^TDiscordEventHandlers;

{$IFDEF CPU32BITS}
procedure Initialize(const ApplicationID: PAnsiChar; AHandlers: PDiscordEventHandlers;
  AutoRegister: Integer; const OptionalSteamID: PAnsiChar); cdecl;
  external 'discord-rpc-x86.dll' name 'Discord_Initialize';

procedure ShutDown; cdecl; external 'dicsord-rpc-x86.dll' name 'Discord_Shutdown';

procedure RunCallbacks; cdecl; external 'dicsord-rpc-x86.dll' name 'Discord_RunCallbacks';

{$IFDEF DISCORD_DISABLE_IO_THREAD}
procedure UpdateConnection; cdecl; external 'dicsord-rpc-x86.dll' name 'Discord_UpdateConnection';
{$ENDIF}
procedure UpdatePresence(const Presence: PDiscordRichPresence); cdecl;
  external 'discord-rpc-x86.dll' name 'Discord_UpdatePresence';

procedure ClearPresence; cdecl; external 'dicsord-rpc-x86.dll' name 'Discord_ClearPresence';

procedure Respond(const AUserID: PAnsiChar; AReply: Integer); cdecl;
  external 'dicsord-rpc-x86.dll' name 'Discord_Respond';

procedure UpdateHandlers(AHandlers: PDiscordEventHandlers); cdecl;
  external 'dicsord-rpc-x86.dll' name 'Discord_UpdateHandlers';
{$ENDIF}
{$IFDEF CPU64BITS}
procedure Initialize(const ApplicationID: PAnsiChar; AHandlers: PDiscordEventHandlers;
  AutoRegister: Integer; const OptionalSteamID: PAnsiChar); cdecl;
  external 'discord-rpc-x64.dll' name 'Discord_Initialize';

procedure ShutDown; cdecl; external 'dicsord-rpc-x64.dll' name 'Discord_Shutdown';

procedure RunCallbacks; cdecl; external 'dicsord-rpc-x64.dll' name 'Discord_RunCallbacks';

{$IFDEF DISCORD_DISABLE_IO_THREAD}
procedure UpdateConnection; cdecl; external 'dicsord-rpc-x64.dll' name 'Discord_UpdateConnection';
{$ENDIF}
procedure UpdatePresence(const Presence: PDiscordRichPresence); cdecl;
  external 'discord-rpc-x64.dll' name 'Discord_UpdatePresence';

procedure ClearPresence; cdecl; external 'dicsord-rpc-x64.dll' name 'Discord_ClearPresence';

procedure Respond(const AUserID: PAnsiChar; AReply: Integer); cdecl;
  external 'dicsord-rpc-x64.dll' name 'Discord_Respond';

procedure UpdateHandlers(AHandlers: PDiscordEventHandlers); cdecl;
  external 'dicsord-rpc-x64.dll' name 'Discord_UpdateHandlers';
{$ENDIF}

implementation

end.

