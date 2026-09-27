	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803FEAC
sub_0803FEAC: @ 0x0803FEAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r0, #0x40
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, _0803FF00 @ =0x02000C60
	bl SetTextFont
	movs r5, #0
	cmp r5, sb
	bge _0803FF3A
	mov sl, r5
	movs r0, #0x98
	mov r8, r0
	movs r7, #0
	movs r6, #0
_0803FED6:
	ldr r0, _0803FF04 @ =0x0203D9AD
	adds r4, r6, r0
	adds r0, r4, #0
	bl GetStringTextLen
	adds r1, r0, #0
	movs r0, #0x48
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	cmp r5, #2
	bgt _0803FF0C
	adds r1, r7, r1
	ldr r0, _0803FF08 @ =0x0203DA10
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	b _0803FF16
	.align 2, 0
_0803FF00: .4byte 0x02000C60
_0803FF04: .4byte 0x0203D9AD
_0803FF08: .4byte 0x0203DA10
_0803FF0C:
	ldr r0, _0803FF4C @ =0x0203DA18
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
_0803FF16:
	ldr r0, [sp]
	adds r0, #0x48
	add r0, sl
	ldr r3, [r0]
	ldr r0, _0803FF4C @ =0x0203DA18
	mov r1, r8
	movs r2, #2
	bl SioDrawNumber
	movs r0, #8
	add sl, r0
	movs r0, #0x20
	add r8, r0
	adds r7, #0x48
	adds r6, #0x13
	adds r5, #1
	cmp r5, sb
	blt _0803FED6
_0803FF3A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF4C: .4byte 0x0203DA18
