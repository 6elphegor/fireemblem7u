	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A754
sub_0803A754: @ 0x0803A754
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0803A7B4 @ =0x0203A8EC
	adds r0, #0x86
	ldrb r0, [r0]
	bl GetUnit
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r1, _0803A7B8 @ =0x03004690
	ldr r1, [r1]
	movs r3, #0x10
	ldrsb r3, [r1, r3]
	subs r7, r2, r3
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	subs r0, r0, r2
	mov r8, r0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r5, r0, r3
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r6, r0, r2
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A7BC
	adds r0, r7, #0
	muls r0, r5, r0
	cmp r0, #0
	blt _0803A7BC
	mov r0, r8
	muls r0, r6, r0
	cmp r0, #0
	blt _0803A7BC
	movs r0, #1
	b _0803A7BE
	.align 2, 0
_0803A7B4: .4byte 0x0203A8EC
_0803A7B8: .4byte 0x03004690
_0803A7BC:
	movs r0, #0
_0803A7BE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
