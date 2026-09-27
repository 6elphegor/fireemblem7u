	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080403B0
sub_080403B0: @ 0x080403B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, _08040420 @ =0x0203D90C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r5, r1, #0x1e
	lsrs r5, r5, #0x1f
	adds r0, #0xa0
	ldrb r0, [r0]
	subs r0, #1
	mov sb, r0
	bl sub_0804528C
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08040424 @ =0x0203DC9C
	ldr r0, _08040428 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r6, _0804042C @ =0x0203DB68
	adds r0, r6, #0
	bl sub_080A1F2C
	adds r0, r4, #0
	mov r1, sb
	adds r2, r5, #0
	mov r3, r8
	bl sub_08040280
	str r0, [r7, #0x58]
	adds r0, r6, #0
	bl sub_080A1EF0
	ldr r1, [r7, #0x58]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08040430
	adds r0, r1, #0
	adds r1, r7, #0
	bl StartSioResultNewHighScore
	b _08040436
	.align 2, 0
_08040420: .4byte 0x0203D90C
_08040424: .4byte 0x0203DC9C
_08040428: .4byte 0x08B98AEC
_0804042C: .4byte 0x0203DB68
_08040430:
	movs r0, #1
	bl FadeBgmOut
_08040436:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
