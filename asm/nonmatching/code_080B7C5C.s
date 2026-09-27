	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7C5C
sub_080B7C5C: @ 0x080B7C5C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r2, _080B7CB4 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080B7CB8 @ =0x081C3590
	ldr r1, _080B7CBC @ =0x06000800
	bl Decompress
	ldr r0, _080B7CC0 @ =0x081C39A4
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B7CC4 @ =0x02022C60
	ldr r1, _080B7CC8 @ =0x081C39C4
	ldr r2, _080B7CCC @ =0x00005040
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	adds r5, #0x44
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7CB4: .4byte 0x03002870
_080B7CB8: .4byte 0x081C3590
_080B7CBC: .4byte 0x06000800
_080B7CC0: .4byte 0x081C39A4
_080B7CC4: .4byte 0x02022C60
_080B7CC8: .4byte 0x081C39C4
_080B7CCC: .4byte 0x00005040
