	.include "macro.inc"

	.syntax unified

	thumb_func_start NewSysGrayBox
NewSysGrayBox: @ 0x080A994C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	ldr r0, _080A9984 @ =0x08CE4AF8
	bl Proc_Start
	adds r5, r0, #0
	ldr r0, _080A9988 @ =0x081D7E54
	ldr r2, _080A998C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _080A9990 @ =0x02022880
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	str r4, [r5, #0x5c]
	str r6, [r5, #0x60]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A9984: .4byte 0x08CE4AF8
_080A9988: .4byte 0x081D7E54
_080A998C: .4byte 0x06010000
_080A9990: .4byte 0x02022880
