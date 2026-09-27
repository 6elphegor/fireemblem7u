	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800626C
sub_0800626C: @ 0x0800626C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetGameTime
	adds r5, r0, #0
	movs r0, #0
	ldr r1, _080062B4 @ =0x02022C60
	mov r8, r1
_0800627E:
	adds r7, r0, #1
	lsls r4, r0, #7
	movs r6, #0x1d
_08006284:
	mov r1, r8
	adds r0, r4, r1
	movs r2, #1
	ands r2, r5
	adds r5, #1
	movs r1, #0
	bl PutSpecialChar
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _08006284
	adds r0, r7, #0
	cmp r0, #9
	ble _0800627E
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080062B4: .4byte 0x02022C60
