	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806BFA4
sub_0806BFA4: @ 0x0806BFA4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, [r0, #0x28]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806BFD0
	ldr r0, [r7]
	movs r1, #1
	bl SetMuFacing
	b _0806BFD8
_0806BFD0:
	ldr r0, [r7]
	movs r1, #2
	bl SetMuFacing
_0806BFD8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
