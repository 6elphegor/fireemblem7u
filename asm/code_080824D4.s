	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080824D4
sub_080824D4: @ 0x080824D4
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r5, [sp, #0x14]
	ldr r4, [sp, #0x18]
	asrs r1, r2, #3
	lsls r1, r1, #5
	adds r0, r0, r1
	asrs r1, r3, #3
	lsls r1, r1, #0xa
	adds r0, r0, r1
	movs r6, #7
	ands r3, r6
	lsls r3, r3, #2
	adds r0, r0, r3
	ands r2, r6
	lsls r2, r2, #2
	movs r1, #0xf
	lsls r1, r2
	ldr r3, [r0]
	ands r3, r1
	cmp r3, #0
	beq _08082520
	asrs r1, r5, #3
	lsls r1, r1, #5
	adds r1, r7, r1
	asrs r0, r4, #3
	lsls r0, r0, #0xa
	adds r1, r1, r0
	ands r4, r6
	lsls r0, r4, #2
	adds r1, r1, r0
	lsrs r3, r2
	ands r5, r6
	lsls r0, r5, #2
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_08082520:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
