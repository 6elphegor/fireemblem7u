	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBanimTerrainGround
GetBanimTerrainGround: @ 0x08052954
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xe
	bhi _08052A1C
	lsls r0, r0, #2
	ldr r1, _0805296C @ =_08052970
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805296C: .4byte _08052970
_08052970: @ jump table
	.4byte _08052A1C @ case 0
	.4byte _080529AC @ case 1
	.4byte _080529B4 @ case 2
	.4byte _080529BC @ case 3
	.4byte _080529C4 @ case 4
	.4byte _080529CC @ case 5
	.4byte _080529D4 @ case 6
	.4byte _080529DC @ case 7
	.4byte _080529E4 @ case 8
	.4byte _080529EC @ case 9
	.4byte _080529F4 @ case 10
	.4byte _080529FC @ case 11
	.4byte _08052A04 @ case 12
	.4byte _08052A0C @ case 13
	.4byte _08052A14 @ case 14
_080529AC:
	ldr r0, _080529B0 @ =0x08BE4887
	b _08052A1E
	.align 2, 0
_080529B0: .4byte 0x08BE4887
_080529B4:
	ldr r0, _080529B8 @ =0x08BE48C8
	b _08052A1E
	.align 2, 0
_080529B8: .4byte 0x08BE48C8
_080529BC:
	ldr r0, _080529C0 @ =0x08BE4909
	b _08052A1E
	.align 2, 0
_080529C0: .4byte 0x08BE4909
_080529C4:
	ldr r0, _080529C8 @ =0x08BE494A
	b _08052A1E
	.align 2, 0
_080529C8: .4byte 0x08BE494A
_080529CC:
	ldr r0, _080529D0 @ =0x08BE498B
	b _08052A1E
	.align 2, 0
_080529D0: .4byte 0x08BE498B
_080529D4:
	ldr r0, _080529D8 @ =0x08BE49CC
	b _08052A1E
	.align 2, 0
_080529D8: .4byte 0x08BE49CC
_080529DC:
	ldr r0, _080529E0 @ =0x08BE4A0D
	b _08052A1E
	.align 2, 0
_080529E0: .4byte 0x08BE4A0D
_080529E4:
	ldr r0, _080529E8 @ =0x08BE4A4E
	b _08052A1E
	.align 2, 0
_080529E8: .4byte 0x08BE4A4E
_080529EC:
	ldr r0, _080529F0 @ =0x08BE4A8F
	b _08052A1E
	.align 2, 0
_080529F0: .4byte 0x08BE4A8F
_080529F4:
	ldr r0, _080529F8 @ =0x08BE4AD0
	b _08052A1E
	.align 2, 0
_080529F8: .4byte 0x08BE4AD0
_080529FC:
	ldr r0, _08052A00 @ =0x08BE4B11
	b _08052A1E
	.align 2, 0
_08052A00: .4byte 0x08BE4B11
_08052A04:
	ldr r0, _08052A08 @ =0x08BE4B52
	b _08052A1E
	.align 2, 0
_08052A08: .4byte 0x08BE4B52
_08052A0C:
	ldr r0, _08052A10 @ =0x08BE4B93
	b _08052A1E
	.align 2, 0
_08052A10: .4byte 0x08BE4B93
_08052A14:
	ldr r0, _08052A18 @ =0x08BE4BD4
	b _08052A1E
	.align 2, 0
_08052A18: .4byte 0x08BE4BD4
_08052A1C:
	ldr r0, _08052A2C @ =0x08BE4846
_08052A1E:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	bx lr
	.align 2, 0
_08052A2C: .4byte 0x08BE4846
