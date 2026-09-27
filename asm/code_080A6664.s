	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6664
sub_080A6664: @ 0x080A6664
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A6680
	ldr r0, _080A66A4 @ =0x06016000
	movs r1, #0xd
	bl LoadHelpBoxGfx
	movs r0, #1
	strb r0, [r4]
_080A6680:
	ldr r0, _080A66A8 @ =0x08CE45C0
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #3
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	movs r3, #2
	ldrsh r1, [r1, r3]
	ldr r3, _080A66AC @ =0x08CE45D8
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A66A4: .4byte 0x06016000
_080A66A8: .4byte 0x08CE45C0
_080A66AC: .4byte 0x08CE45D8
