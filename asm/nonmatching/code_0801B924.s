	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B924
sub_0801B924: @ 0x0801B924
	push {r4, lr}
	ldr r0, _0801B974 @ =OnMain
	bl SetMainFunc
	ldr r0, _0801B978 @ =OnVBlank
	bl SetOnVBlank
	bl RefreshBMapGraphics
	movs r0, #2
	movs r1, #0
	bl DebugInitBg
	ldr r0, _0801B97C @ =0x081C3BA4
	bl SetTalkUnkStr
	ldr r0, _0801B980 @ =0x08B95890
	bl StartMenu
	ldr r4, _0801B984 @ =0x0202BBB8
	movs r1, #0x40
	ldrb r2, [r4, #4]
	orrs r1, r2
	strb r1, [r4, #4]
	ldr r1, _0801B988 @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	bl StartMuralBackgroundAlt
	movs r0, #0xbf
	ldrb r1, [r4, #4]
	ands r0, r1
	strb r0, [r4, #4]
	ldr r0, _0801B98C @ =0x02023CA0
	bl PutBuildInfo
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B974: .4byte OnMain
_0801B978: .4byte OnVBlank
_0801B97C: .4byte 0x081C3BA4
_0801B980: .4byte 0x08B95890
_0801B984: .4byte 0x0202BBB8
_0801B988: .4byte 0x0600B000
_0801B98C: .4byte 0x02023CA0
