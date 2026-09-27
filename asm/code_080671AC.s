	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080671AC
sub_080671AC: @ 0x080671AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	mov sb, r0
	movs r7, #0
	cmp r7, r8
	bhs _08067220
_080671C6:
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl Div
	strh r0, [r4]
	adds r4, #2
	adds r7, #1
	cmp r7, r8
	blo _080671C6
_08067220:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
