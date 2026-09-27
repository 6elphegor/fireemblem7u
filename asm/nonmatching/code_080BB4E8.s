	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB4E8
sub_080BB4E8: @ 0x080BB4E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080BB518 @ =0x03001620
	movs r4, #0
	str r4, [r0]
	ldr r0, _080BB51C @ =0x020072BC
	str r4, [r0]
	bl sub_080BB2AC
	bl InitOpScanlineBuf
	bl sub_080BB070
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080BB520 @ =HBlank_80BBDD0
	bl SetOnHBlankA
	adds r5, #0x4c
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB518: .4byte 0x03001620
_080BB51C: .4byte 0x020072BC
_080BB520: .4byte HBlank_80BBDD0
