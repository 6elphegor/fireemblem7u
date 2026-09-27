	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B32A0
sub_080B32A0: @ 0x080B32A0
	push {lr}
	ldr r2, _080B32C8 @ =0x02000000
	ldrb r0, [r2]
	movs r3, #4
	ldrsh r1, [r2, r3]
	cmp r1, #0
	bge _080B32B0
	adds r1, #7
_080B32B0:
	asrs r1, r1, #3
	movs r3, #6
	ldrsh r2, [r2, r3]
	cmp r2, #0
	bge _080B32BC
	adds r2, #7
_080B32BC:
	asrs r2, r2, #3
	bl sub_080B5E80
	pop {r0}
	bx r0
	.align 2, 0
_080B32C8: .4byte 0x02000000
