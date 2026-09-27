	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805FFD0
sub_0805FFD0: @ 0x0805FFD0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060000
	ldr r0, _0805FFF8 @ =0x02019784
	ldr r1, _0805FFFC @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	b _08060014
	.align 2, 0
_0805FFF8: .4byte 0x02019784
_0805FFFC: .4byte 0x02023460
_08060000:
	ldr r0, _08060044 @ =0x02019784
	ldr r1, _08060048 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
_08060014:
	movs r0, #2
	bl EnableBgSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r4, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _08060056
	strh r2, [r4, #0x2c]
	movs r0, #6
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x32]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806004C
	movs r0, #0x80
	b _0806004E
	.align 2, 0
_08060044: .4byte 0x02019784
_08060048: .4byte 0x02023460
_0806004C:
	ldr r0, _08060060 @ =0x0000FF80
_0806004E:
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_08060056:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060060: .4byte 0x0000FF80
