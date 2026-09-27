	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080958C8
sub_080958C8: @ 0x080958C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r5, r1, #0
	str r2, [sp, #8]
	adds r0, r3, #0
	bl DecodeMsg
	mov sl, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIconId
	mov r8, r0
	mov r0, sl
	bl GetStringTextLen
	mov sb, r0
	mov r1, sb
	adds r1, #7
	mov r0, r8
	cmp r0, #0
	beq _08095900
	movs r0, #0x68
	b _08095902
_08095900:
	movs r0, #0x78
_08095902:
	subs r0, r0, r1
	cmp r0, #0
	bge _0809590A
	adds r0, #0xf
_0809590A:
	asrs r0, r0, #4
	adds r5, r5, r0
	ldr r1, [sp, #8]
	lsls r6, r1, #5
	mov r0, r8
	cmp r0, #0
	beq _08095932
	adds r4, r6, r5
	lsls r4, r4, #1
	ldr r0, _08095948 @ =0x02023C60
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
_08095932:
	ldr r4, _0809594C @ =0x02012A80
	adds r0, r4, #0
	bl ClearText
	mov r1, r8
	cmp r1, #0
	beq _08095950
	adds r0, r6, #2
	adds r0, r0, r5
	b _08095952
	.align 2, 0
_08095948: .4byte 0x02023C60
_0809594C: .4byte 0x02012A80
_08095950:
	adds r0, r6, r5
_08095952:
	lsls r0, r0, #1
	ldr r1, _080959AC @ =0x02023C60
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r7, #0x40]
	ldr r1, [sp, #8]
	lsls r0, r1, #3
	subs r0, #4
	str r0, [r7, #0x44]
	mov r0, sb
	adds r0, #7
	cmp r0, #0
	bge _08095988
	adds r0, #7
_08095988:
	asrs r0, r0, #3
	str r0, [r7, #0x48]
	mov r1, r8
	cmp r1, #0
	beq _08095996
	adds r0, #2
	str r0, [r7, #0x48]
_08095996:
	movs r0, #2
	str r0, [r7, #0x4c]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080959AC: .4byte 0x02023C60
