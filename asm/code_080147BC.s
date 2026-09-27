	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080147BC
sub_080147BC: @ 0x080147BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	ldr r0, [sp, #0x24]
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	adds r3, r2, #0
	adds r0, r3, r0
	cmp r3, r0
	bge _08014814
	mov r8, r0
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
_080147E0:
	mov r1, sl
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	adds r6, r3, #1
	cmp r1, r0
	bge _0801480E
	adds r5, r0, #0
	lsls r0, r3, #6
	add r0, sb
	mov r7, ip
	adds r2, r7, r0
_080147F6:
	cmp r1, #0x1f
	bhi _08014800
	cmp r3, #0x1f
	bhi _08014800
	strh r4, [r2]
_08014800:
	adds r2, #2
	adds r1, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r1, r5
	blt _080147F6
_0801480E:
	adds r3, r6, #0
	cmp r3, r8
	blt _080147E0
_08014814:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
