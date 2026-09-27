	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonTunk
NewEkrDragonTunk: @ 0x080661B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080661F0 @ =0x08BD9550
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	ldr r0, _080661F4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080661DE
	ldr r0, _080661F8 @ =0x0000FFE0
_080661DE:
	strh r0, [r5, #0x32]
	movs r0, #1
	bl FadeBgmOut
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080661F0: .4byte 0x08BD9550
_080661F4: .4byte 0x0203E02C
_080661F8: .4byte 0x0000FFE0
