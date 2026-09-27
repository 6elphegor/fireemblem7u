	.include "macro.inc"

	.syntax unified

	thumb_func_start LATeamSpriteDraw_Loop
LATeamSpriteDraw_Loop: @ 0x080485AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	b _08048614
_080485C0:
	mov r1, r8
	lsls r0, r1, #4
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	ldr r0, [r4, #0x38]
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r5, r0
	bge _08048612
	ldr r0, [r4, #0x34]
	cmp r5, r0
	ble _08048612
	movs r6, #0
	mov r0, r8
	lsls r0, r0, #2
	mov sb, r0
	movs r7, #0
_080485E4:
	mov r0, sb
	add r0, r8
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _0804860A
	ldr r1, [r4, #0x2c]
	adds r1, r1, r7
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #3
	bl sub_080263A0
_0804860A:
	adds r7, #0xe
	adds r6, #1
	cmp r6, #4
	ble _080485E4
_08048612:
	mov r8, sl
_08048614:
	ldr r0, [r4, #0x3c]
	cmp r8, r0
	blt _080485C0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
