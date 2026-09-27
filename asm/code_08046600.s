	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046600
sub_08046600: @ 0x08046600
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	adds r5, r7, #0
	adds r0, r7, #5
	cmp r7, r0
	bge _0804664A
_08046616:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _0804666C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046642
	ldr r0, [r4]
	cmp r0, #0
	beq _08046642
	movs r0, #1
	add r8, r0
	adds r0, r4, #0
	bl sub_08046598
	adds r6, r6, r0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r6, r6, r0
_08046642:
	adds r5, #1
	adds r0, r7, #5
	cmp r5, r0
	blt _08046616
_0804664A:
	ldr r0, _08046670 @ =0x0203DC9C
	asrs r1, r7, #6
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r6, r0
	adds r0, r6, #0
	mov r1, r8
	bl Div
	adds r6, r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804666C: .4byte 0x00010004
_08046670: .4byte 0x0203DC9C
