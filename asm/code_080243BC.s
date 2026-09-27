	.include "macro.inc"

	.syntax unified

	thumb_func_start MakePoisonDamageTargetList
MakePoisonDamageTargetList: @ 0x080243BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	mov r7, r8
	b _0802441A
_080243D0:
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0802441A
	ldr r0, [r2]
	cmp r0, #0
	beq _0802441A
	ldr r0, [r2, #0xc]
	ldr r1, _08024430 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _0802441A
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _0802441A
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	movs r6, #0xb
	ldrsb r6, [r2, r6]
	movs r0, #3
	bl RandNext
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EnlistTarget
_0802441A:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _080243D0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024430: .4byte 0x0001002C
