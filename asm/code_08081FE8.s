	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08081FE8
sub_08081FE8: @ 0x08081FE8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _08082010 @ =0x08CC209C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08082004
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_StartBlocking
_08082004:
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08082010: .4byte 0x08CC209C
