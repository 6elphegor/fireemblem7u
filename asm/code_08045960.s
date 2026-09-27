	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045960
sub_08045960: @ 0x08045960
	push {r4, lr}
	adds r4, r0, #0
	bl ResetTextFont
	ldr r1, _080459A0 @ =0x0203DC9C
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, _080459A4 @ =0x03001400
	ldrb r1, [r1, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, _080459A8 @ =0x03004690
	str r0, [r1]
	bl sub_08044AEC
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _080459AC @ =0x08B9A7B8
	bl StartMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080459A0: .4byte 0x0203DC9C
_080459A4: .4byte 0x03001400
_080459A8: .4byte 0x03004690
_080459AC: .4byte 0x08B9A7B8
