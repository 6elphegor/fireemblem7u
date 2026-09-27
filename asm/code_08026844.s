	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearUnitSupports
ClearUnitSupports: @ 0x08026844
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	bl GetUnitSupporterCount
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _0802688C
	mov r8, r6
_0802685A:
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08026886
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl GetUnitSupportNumByPid
	adds r1, r4, #0
	adds r1, #0x32
	adds r1, r1, r0
	mov r0, r8
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
_08026886:
	adds r6, #1
	cmp r6, r7
	blt _0802685A
_0802688C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
