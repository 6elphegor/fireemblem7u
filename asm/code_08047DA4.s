	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047DA4
sub_08047DA4: @ 0x08047DA4
	push {lr}
	ldr r0, _08047DB0 @ =0x08B9A3A8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08047DB0: .4byte 0x08B9A3A8

	thumb_func_start sub_08047DB4
sub_08047DB4: @ 0x08047DB4
	ldr r3, _08047DF4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xf
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _08047DF8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _08047DFC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_08047DF4: .4byte 0x03002870
_08047DF8: .4byte 0x0000FFE0
_08047DFC: .4byte 0x0000E0FF

	thumb_func_start sub_08047E00
sub_08047E00: @ 0x08047E00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08047E7C @ =0x00007E08
	mov sb, r0
	ldr r2, [r5, #0x2c]
	ldr r0, [r5, #0x34]
	adds r2, r2, r0
	asrs r2, r2, #1
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x38]
	adds r0, r0, r1
	asrs r0, r0, #1
	mov r8, r0
	str r2, [r5, #0x34]
	str r0, [r5, #0x38]
	movs r7, #0
	adds r6, r2, #0
_08047E2A:
	ldr r4, [r5, #0x40]
	adds r0, r4, #0
	cmp r4, #0
	bge _08047E34
	adds r0, r4, #7
_08047E34:
	asrs r0, r0, #3
	adds r0, r0, r7
	ldr r1, [r5, #0x3c]
	bl __modsi3
	movs r1, #7
	ands r4, r1
	subs r1, r6, r4
	add r0, sb
	str r0, [sp]
	movs r0, #0xc
	mov r2, r8
	ldr r3, _08047E80 @ =0x08B9A3C8
	bl PutSprite
	adds r6, #8
	adds r7, #1
	cmp r7, #0x1f
	ble _08047E2A
	ldr r1, [r5, #0x40]
	adds r1, #1
	str r1, [r5, #0x40]
	ldr r0, [r5, #0x3c]
	lsls r0, r0, #3
	cmp r1, r0
	bne _08047E6C
	movs r0, #0
	str r0, [r5, #0x40]
_08047E6C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047E7C: .4byte 0x00007E08
_08047E80: .4byte 0x08B9A3C8

	thumb_func_start sub_08047E84
sub_08047E84: @ 0x08047E84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _08047F08 @ =0x081C4878
	ldr r1, _08047F0C @ =0x02020140
	bl Decompress
	movs r4, #0
	cmp r4, r6
	bge _08047EC8
	ldr r5, _08047F10 @ =0x06014100
_08047EA4:
	adds r0, r4, #0
	adds r1, r6, #0
	bl __modsi3
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08047F0C @ =0x02020140
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl sub_08047CB8
	adds r5, #0x20
	adds r4, #1
	cmp r4, r6
	blt _08047EA4
_08047EC8:
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #5
	ldr r1, _08047F14 @ =0x081C8004
	adds r0, r0, r1
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08047F18 @ =0x08B9A3D0
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl Proc_Start
	mov r1, r8
	str r1, [r0, #0x2c]
	str r1, [r0, #0x34]
	mov r1, sb
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	str r6, [r0, #0x3c]
	movs r1, #0
	str r1, [r0, #0x40]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047F08: .4byte 0x081C4878
_08047F0C: .4byte 0x02020140
_08047F10: .4byte 0x06014100
_08047F14: .4byte 0x081C8004
_08047F18: .4byte 0x08B9A3D0

	thumb_func_start sub_08047F1C
sub_08047F1C: @ 0x08047F1C
	push {lr}
	ldr r2, _08047F48 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _08047F4C @ =0x08B9A3D0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08047F48: .4byte 0x03002870
_08047F4C: .4byte 0x08B9A3D0

	thumb_func_start sub_08047F50
sub_08047F50: @ 0x08047F50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08047F68 @ =0x08B9A3D0
	bl Proc_Find
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047F68: .4byte 0x08B9A3D0

	thumb_func_start sub_08047F6C
sub_08047F6C: @ 0x08047F6C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08047F88 @ =0x08B9A3D0
	bl Proc_Find
	str r4, [r0, #0x34]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x38]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047F88: .4byte 0x08B9A3D0

	thumb_func_start sub_08047F8C
sub_08047F8C: @ 0x08047F8C
	push {lr}
	lsls r0, r0, #5
	ldr r1, _08047FA4 @ =0x081C8004
	adds r0, r0, r1
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08047FA4: .4byte 0x081C8004

	thumb_func_start sub_08047FA8
sub_08047FA8: @ 0x08047FA8
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08047FEC @ =0x081D55DE
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _08047FF0 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08047FE4
	mov r1, sp
	adds r0, r1, r4
	ldrb r2, [r0]
	adds r2, #0x10
	ldr r3, _08047FF4 @ =0x02022860
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r3, r3, r1
	strh r0, [r3]
	bl EnablePalSync
_08047FE4:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047FEC: .4byte 0x081D55DE
_08047FF0: .4byte 0x0203DCE8
_08047FF4: .4byte 0x02022860

	thumb_func_start sub_08047FF8
sub_08047FF8: @ 0x08047FF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0804813C @ =0x000082DA
	mov r8, r0
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	ldr r3, _08048140 @ =0x08B9A3F0
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, _08048144 @ =0x081D559C
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r6, [r5]
	lsls r0, r6, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldrb r5, [r5]
	cmp r5, #2
	bne _08048042
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl sub_08047FA8
_08048042:
	adds r2, r7, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r7, #0x2e]
	cmp r1, r0
	bne _0804812E
	ldrh r1, [r7, #0x3a]
	ldrh r2, [r7, #0x36]
	adds r0, r1, r2
	strh r0, [r7, #0x36]
	ldrh r2, [r7, #0x3c]
	ldrh r3, [r7, #0x38]
	adds r0, r2, r3
	strh r0, [r7, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08048076
	subs r0, r1, #1
	strh r0, [r7, #0x3a]
_08048076:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08048082
	subs r0, r2, #1
	strh r0, [r7, #0x3c]
_08048082:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080480AA
	ldrh r1, [r7, #0x32]
	movs r6, #0x32
	ldrsh r0, [r7, r6]
	cmp r0, #0
	bge _0804809C
	adds r0, r1, #1
	strh r0, [r7, #0x32]
_0804809C:
	ldrh r1, [r7, #0x34]
	movs r2, #0x34
	ldrsh r0, [r7, r2]
	cmp r0, #0x34
	ble _080480AA
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_080480AA:
	movs r3, #0x2a
	ldrsh r5, [r7, r3]
	movs r6, #0x32
	ldrsh r0, [r7, r6]
	adds r0, #0x46
	adds r5, r5, r0
	movs r0, #0x2c
	ldrsh r4, [r7, r0]
	adds r4, #8
	ldr r6, _08048148 @ =0x08B905D0
	ldrh r1, [r7, #0x36]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r2, #0x2a
	ldrsh r5, [r7, r2]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	adds r0, #0x46
	adds r5, r5, r0
	movs r6, #0x2c
	ldrsh r4, [r7, r6]
	adds r4, #8
	ldr r6, _0804814C @ =0x08B90620
	ldrh r1, [r7, #0x38]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	adds r1, #0x4b
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	adds r2, #8
	ldr r3, _08048150 @ =0x08B9A404
	ldr r0, _08048154 @ =0x0203D90C
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_0804812E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804813C: .4byte 0x000082DA
_08048140: .4byte 0x08B9A3F0
_08048144: .4byte 0x081D559C
_08048148: .4byte 0x08B905D0
_0804814C: .4byte 0x08B90620
_08048150: .4byte 0x08B9A404
_08048154: .4byte 0x0203D90C

	thumb_func_start StartSioMenuItem
StartSioMenuItem: @ 0x08048158
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r2, r3, #0
	ldr r6, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080481C4 @ =0x08B9A410
	mov r1, r8
	str r2, [sp]
	bl Proc_Start
	mov r8, r0
	movs r3, #0
	movs r1, #0
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #1
	ldr r2, [sp]
	strb r2, [r0]
	mov r0, r8
	strh r1, [r0, #0x32]
	movs r0, #0x34
	mov r2, r8
	strh r0, [r2, #0x34]
	strh r1, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #4
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x3a]
	mov r0, r8
	adds r0, #0x3e
	strb r3, [r0]
	subs r0, #0xe
	strb r3, [r0]
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080481C4: .4byte 0x08B9A410

	thumb_func_start SioMenuItem_SetArrowConfig
SioMenuItem_SetArrowConfig: @ 0x080481C8
	push {r4, lr}
	ldr r4, [sp, #8]
	strh r1, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r3, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SioMenuItem_SetPosition
SioMenuItem_SetPosition: @ 0x080481DC
	strh r1, [r0, #0x2a]
	strh r2, [r0, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start sub_080481E4
sub_080481E4: @ 0x080481E4
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _0804822C @ =0x081C80C4
	ldr r1, _08048230 @ =0x081D55DE
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _08048234 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048222
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldr r1, _08048238 @ =0x02022860
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r2, _0804823C @ =0x0000033E
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
_08048222:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804822C: .4byte 0x081C80C4
_08048230: .4byte 0x081D55DE
_08048234: .4byte 0x0203DCE8
_08048238: .4byte 0x02022860
_0804823C: .4byte 0x0000033E

	thumb_func_start sub_08048240
sub_08048240: @ 0x08048240
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _08048288 @ =0x081C8124
	ldr r1, _0804828C @ =0x081D55DE
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _08048290 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048280
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldr r1, _08048294 @ =0x02022860
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
_08048280:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048288: .4byte 0x081C8124
_0804828C: .4byte 0x081D55DE
_08048290: .4byte 0x0203DCE8
_08048294: .4byte 0x02022860

	thumb_func_start sub_08048298
sub_08048298: @ 0x08048298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080482D8 @ =0x0203D90C
	ldrb r0, [r0]
	cmp r0, #1
	beq _080482B0
	b _08048420
_080482B0:
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	mov r8, r2
	str r0, [sp, #4]
	cmp r1, #0
	beq _080482CA
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_080482CA:
	ldr r3, _080482DC @ =0x08B9A428
	cmp r1, #0
	beq _080482E0
	movs r0, #0x80
	lsls r0, r0, #4
	b _080482E4
	.align 2, 0
_080482D8: .4byte 0x0203D90C
_080482DC: .4byte 0x08B9A428
_080482E0:
	movs r0, #0x80
	lsls r0, r0, #3
_080482E4:
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	bge _08048346
	movs r5, #0x20
_080482FA:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r4, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #8
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _08048400 @ =0x081D55FE
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804833C
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, #8
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _08048404 @ =0x081D562C
	bl PutSprite
_0804833C:
	adds r5, #0x18
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _080482FA
_08048346:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	beq _080483F8
	ldr r0, _08048408 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048376
	bl GetGameTime
	ldr r2, _0804840C @ =0x02022860
	movs r1, #0x3f
	ands r1, r0
	lsrs r1, r1, #2
	lsls r1, r1, #1
	ldr r0, _08048410 @ =0x0840628C
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _08048414 @ =0x0000031A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
_08048376:
	ldr r0, [r7, #0x40]
	cmp r0, #0xff
	bgt _08048380
	adds r0, #0x10
	str r0, [r7, #0x40]
_08048380:
	ldr r4, _08048418 @ =0x080C5A48
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, _0804841C @ =0x081D5646
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl PutSprite
_080483F8:
	bl sub_08048240
	b _080484AE
	.align 2, 0
_08048400: .4byte 0x081D55FE
_08048404: .4byte 0x081D562C
_08048408: .4byte 0x0203DCE8
_0804840C: .4byte 0x02022860
_08048410: .4byte 0x0840628C
_08048414: .4byte 0x0000031A
_08048418: .4byte 0x080C5A48
_0804841C: .4byte 0x081D5646
_08048420:
	ldr r3, _08048488 @ =0x08B9A428
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	adds r1, r7, #0
	adds r1, #0x44
	str r1, [sp, #4]
	cmp r6, r0
	bge _080484AA
	ldr r2, _0804848C @ =0x08B9A4A0
	mov sl, r2
	movs r0, #8
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0x28
	mov r8, r1
_0804844C:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r5, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r7, #0
	adds r4, #0x3a
	adds r4, r4, r6
	ldrb r2, [r4]
	lsls r0, r2, #2
	add r0, sl
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r2, r8
	bl PutSprite
	ldrb r0, [r4]
	cmp r0, #0
	beq _08048490
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _0804849E
	adds r0, r1, #1
	b _0804849C
	.align 2, 0
_08048488: .4byte 0x08B9A428
_0804848C: .4byte 0x08B9A4A0
_08048490:
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, sb
	ble _0804849E
	subs r0, r1, #1
_0804849C:
	strh r0, [r5]
_0804849E:
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _0804844C
_080484AA:
	bl sub_080481E4
_080484AE:
	ldr r0, _080484FC @ =0x0203D90C
	movs r1, #0x80
	lsls r1, r1, #4
	mov r8, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080484C2
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
_080484C2:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080484D4
	movs r0, #0xc0
	movs r1, #0x10
	bl PutLinkArenaButtonSpriteAt
_080484D4:
	ldr r0, [r7, #0x48]
	cmp r0, #0
	blt _080484EC
	adds r2, r0, #0
	adds r2, #8
	ldr r3, _08048500 @ =0x08B9A466
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	bl PutSprite
_080484EC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080484FC: .4byte 0x0203D90C
_08048500: .4byte 0x08B9A466

	thumb_func_start sub_08048504
sub_08048504: @ 0x08048504
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _080485A4 @ =0x08B9A4A8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	str r2, [r4, #0x40]
	subs r0, #2
	str r0, [r4, #0x48]
	movs r3, #0
	adds r5, r4, #0
	adds r5, #0x3a
	ldr r0, _080485A8 @ =0x0000FFF8
	mov ip, r0
	adds r2, r4, #0
	adds r2, #0x30
_08048544:
	adds r0, r5, r3
	mov r7, r8
	adds r1, r7, r3
	ldrb r1, [r1]
	strb r1, [r0]
	mov r0, ip
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _08048544
	ldr r2, [r6, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	adds r0, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0xe0
	movs r1, #0x28
	movs r3, #6
	bl StartLinkArenaMenuScrollBar
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0x28
	subs r1, r1, r0
	ldr r0, [r6, #0x38]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x98
	movs r2, #0x88
	movs r3, #0x27
	bl PutLinkArenaTeamSprites
	adds r0, r4, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080485A4: .4byte 0x08B9A4A8
_080485A8: .4byte 0x0000FFF8

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

	thumb_func_start PutLinkArenaTeamSprites
PutLinkArenaTeamSprites: @ 0x0804862C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	adds r7, r2, #0
	mov r8, r3
	ldr r6, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r4, _08048670 @ =0x08B9A4C0
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x2c]
	mov r1, sl
	str r1, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	str r7, [r0, #0x38]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048670: .4byte 0x08B9A4C0

	thumb_func_start ScrollMultiArenaTeamSprites
ScrollMultiArenaTeamSprites: @ 0x08048674
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804868C @ =0x08B9A4C0
	bl Proc_Find
	ldr r1, [r0, #0x30]
	adds r1, r1, r4
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804868C: .4byte 0x08B9A4C0

	thumb_func_start UpdateNameEntrySpriteGlow
UpdateNameEntrySpriteGlow: @ 0x08048690
	push {r4, r5, r6, lr}
	ldr r5, _080486D4 @ =0x081C8104
	ldr r0, _080486D8 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080486CE
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _080486DC @ =0x02022860
	movs r4, #0xf
	ldr r6, _080486E0 @ =0x00000336
	adds r3, r0, r6
_080486B6:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble _080486B6
	bl EnablePalSync
_080486CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080486D4: .4byte 0x081C8104
_080486D8: .4byte 0x0203DCE8
_080486DC: .4byte 0x02022860
_080486E0: .4byte 0x00000336

	thumb_func_start sub_080486E4
sub_080486E4: @ 0x080486E4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x2c]
	adds r1, r1, r0
	asrs r1, r1, #1
	ldr r2, [r7, #0x38]
	ldr r0, [r7, #0x30]
	adds r2, r2, r0
	asrs r2, r2, #1
	str r1, [r7, #0x2c]
	str r2, [r7, #0x30]
	ldr r3, _08048750 @ =0x08B9A4D8
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x40]
	adds r1, #0x60
	ldr r3, _08048754 @ =0x081D5664
	str r4, [sp]
	movs r0, #2
	movs r2, #0x30
	bl PutSprite
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08048760
	ldr r3, _08048758 @ =0x08B9A428
	str r4, [sp]
	movs r0, #2
	movs r1, #0x60
	movs r2, #0x20
	bl PutSprite
	ldr r3, _0804875C @ =0x081D55FE
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	b _08048780
	.align 2, 0
_08048750: .4byte 0x08B9A4D8
_08048754: .4byte 0x081D5664
_08048758: .4byte 0x08B9A428
_0804875C: .4byte 0x081D55FE
_08048760:
	ldr r3, _080487A8 @ =0x08B9A436
	str r0, [sp]
	movs r0, #2
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	ldr r3, _080487AC @ =0x081D5618
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
_08048780:
	movs r4, #3
	ldr r0, _080487B0 @ =0x08B9A4E0
	adds r6, r0, #0
	adds r6, #0xc
	movs r5, #0x78
_0804878A:
	ldr r0, [r7, #0x44]
	cmp r0, r4
	bne _080487B4
	cmp r4, #2
	bgt _080487B4
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
	b _080487C6
	.align 2, 0
_080487A8: .4byte 0x08B9A436
_080487AC: .4byte 0x081D5618
_080487B0: .4byte 0x08B9A4E0
_080487B4:
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
_080487C6:
	adds r6, #4
	adds r5, #0x10
	adds r4, #1
	cmp r4, #4
	ble _0804878A
	bl UpdateNameEntrySpriteGlow
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StartNameEntrySpriteDraw
StartNameEntrySpriteDraw: @ 0x080487DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _08048818 @ =0x08B9A4F4
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	str r5, [r0, #0x34]
	str r5, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	movs r1, #1
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08048818: .4byte 0x08B9A4F4

	thumb_func_start UpdateNameEntrySpriteDraw
UpdateNameEntrySpriteDraw: @ 0x0804881C
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [sp, #0x10]
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	str r4, [r0, #0x3c]
	str r3, [r0, #0x40]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RuleSettingSprites_Interactive_Loop
RuleSettingSprites_Interactive_Loop: @ 0x08048834
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r7, r0, #2
	ldrh r0, [r5, #0x2c]
	strh r0, [r5, #0x2a]
	ldr r0, _080488A4 @ =0x08B9A50C
	mov r8, r0
	movs r6, #0x30
	movs r4, #2
_0804885A:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r6, #0
	bl PutSprite
	adds r6, #0x18
	subs r4, #1
	cmp r4, #0
	bge _0804885A
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0x20
	bl DisplayFrozenUiHand
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl PutUiHand
	movs r0, #0xc0
	movs r1, #0x10
	bl PutLinkArenaButtonSpriteAt
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080488A4: .4byte 0x08B9A50C

	thumb_func_start StartRuleSettingSpriteDrawInteractive
StartRuleSettingSpriteDrawInteractive: @ 0x080488A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080488C8 @ =0x08B9A518
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2a]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080488C8: .4byte 0x08B9A518

	thumb_func_start UpdateRuleSettingSprites
UpdateRuleSettingSprites: @ 0x080488CC
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r3, [r0, #0x30]
	bx lr

	thumb_func_start UpdateSioMenuBurstGlow
UpdateSioMenuBurstGlow: @ 0x080488D4
	push {lr}
	adds r1, r0, #0
	ldr r2, _08048900 @ =0x081C8104
	ldr r0, _08048904 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080488FA
	ldr r0, _08048908 @ =0x02022860
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
_080488FA:
	pop {r0}
	bx r0
	.align 2, 0
_08048900: .4byte 0x081C8104
_08048904: .4byte 0x0203DCE8
_08048908: .4byte 0x02022860

	thumb_func_start SioMenuBurstFx_Loop
SioMenuBurstFx_Loop: @ 0x0804890C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r5, #1
	adds r0, r5, #0
	bl UpdateSioMenuBurstGlow
	ldr r0, _080489AC @ =0x081D56E4
	adds r4, #1
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r1, #0
	ldrsh r6, [r4, r1]
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	lsls r5, r5, #2
	adds r5, r5, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _080489B0 @ =0x081D56AC
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _080489B4 @ =0x081D56BA
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _080489B8 @ =0x081D56C8
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _080489BC @ =0x081D56D6
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _080489A0
	adds r0, r7, #0
	bl Proc_Break
_080489A0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080489AC: .4byte 0x081D56E4
_080489B0: .4byte 0x081D56AC
_080489B4: .4byte 0x081D56BA
_080489B8: .4byte 0x081D56C8
_080489BC: .4byte 0x081D56D6

	thumb_func_start sub_080489C0
sub_080489C0: @ 0x080489C0
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080489E0 @ =0x08B9A530
	adds r1, r3, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080489E0: .4byte 0x08B9A530

	thumb_func_start sub_080489E4
sub_080489E4: @ 0x080489E4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x45
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #7
	ldr r4, [r6, #0x34]
	ldrb r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #3
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08048A20
sub_08048A20: @ 0x08048A20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r1, [r7, #0x30]
	str r1, [sp, #0xc]
	adds r1, #8
	mov sl, r1
	ldr r0, [r7, #0x38]
	asrs r2, r0, #3
	str r2, [sp, #0x10]
	movs r1, #7
	ands r0, r1
	movs r1, #8
	subs r0, r1, r0
	str r0, [sp, #0x14]
	movs r3, #0x3e
	ldrsh r0, [r7, r3]
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r1, [r1]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	movs r0, #0x3c
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0x3d
	adds r1, r1, r7
	mov sb, r1
	ldrb r2, [r0]
	ldrb r3, [r1]
	cmp r2, r3
	bhi _08048A70
	b _08048BC8
_08048A70:
	adds r5, r7, #0
	adds r5, #0x44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x45
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x40
	movs r1, #0x3e
	ldrsh r2, [r7, r1]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r3, r5, #0
	str r0, [sp, #0x2c]
	cmp r2, r1
	bge _08048A9E
	ldrb r0, [r3]
	adds r0, #2
	strb r0, [r3]
_08048A9E:
	movs r0, #0x3e
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08048AB2
	ldrb r0, [r4]
	adds r0, #2
	strb r0, [r4]
_08048AB2:
	movs r6, #0
	mov r0, ip
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	add r1, sl
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	lsls r2, r2, #3
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	str r3, [sp, #0x20]
_08048AC8:
	ldrb r0, [r5]
	cmp r0, #0x30
	bls _08048AD2
	movs r0, #0
	strb r0, [r5]
_08048AD2:
	lsls r4, r6, #2
	add r4, sp
	adds r4, #4
	ldrb r1, [r5]
	lsrs r0, r1, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4]
	adds r5, #1
	adds r6, #1
	cmp r6, #1
	ble _08048AC8
	movs r2, #0x3e
	ldrsh r0, [r7, r2]
	cmp r0, #0
	beq _08048B0A
	mov r2, sl
	subs r2, #9
	ldr r3, _08048BD8 @ =0x08B9A550
	ldr r0, [sp, #4]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_08048B0A:
	movs r3, #0x3e
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08048B14
	adds r0, #0xf
_08048B14:
	asrs r0, r0, #4
	mov r1, sb
	ldrb r1, [r1]
	adds r0, r1, r0
	ldr r2, [sp, #0x28]
	ldrb r2, [r2]
	cmp r0, r2
	bge _08048B3A
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	adds r2, #1
	ldr r3, _08048BDC @ =0x08B9A548
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_08048B3A:
	movs r6, #0
	ldr r0, [r7, #0x34]
	cmp r6, r0
	bge _08048B5E
	mov r4, sl
	movs r5, #1
_08048B46:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _08048BE0 @ =0x08B9A558
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r0, [r7, #0x34]
	cmp r6, r0
	blt _08048B46
_08048B5E:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble _08048B80
	ldr r4, [sp, #0x1c]
	movs r5, #0
	adds r6, r3, #0
_08048B6A:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _08048BE0 @ =0x08B9A558
	bl PutSprite
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _08048B6A
_08048B80:
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	adds r2, r0, r1
	ldr r3, [sp, #0x14]
	subs r2, r2, r3
	ldr r4, _08048BE0 @ =0x08B9A558
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r3, r4, #0
	bl PutSprite
	movs r5, #2
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	ldr r2, [sp, #0x20]
	adds r3, r4, #0
	bl PutSprite
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r8
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	subs r2, #7
	str r5, [sp]
	movs r0, #2
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r7, #0x3e]
	ldr r1, [sp, #0x2c]
	strh r0, [r1]
_08048BC8:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048BD8: .4byte 0x08B9A550
_08048BDC: .4byte 0x08B9A548
_08048BE0: .4byte 0x08B9A558

	thumb_func_start StartLinkArenaMenuScrollBar
StartLinkArenaMenuScrollBar: @ 0x08048BE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov sl, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r4, _08048C4C @ =0x08B9A560
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r7, #0
	bl Proc_Start
	adds r1, r0, #0
	mov r2, sb
	str r2, [r1, #0x2c]
	mov r0, sl
	str r0, [r1, #0x30]
	lsls r0, r5, #1
	subs r0, #2
	str r0, [r1, #0x34]
	adds r0, r1, #0
	adds r0, #0x3c
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r6, [r1, #0x3e]
	adds r0, #3
	strh r6, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048C4C: .4byte 0x08B9A560

	thumb_func_start sub_08048C50
sub_08048C50: @ 0x08048C50
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _08048CA4 @ =0x08B9A560
	bl Proc_Find
	adds r6, r0, #0
	cmp r6, #0
	beq _08048C9C
	adds r5, r6, #0
	adds r5, #0x3c
	strb r7, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x3d
	ldr r4, [r6, #0x34]
	ldrb r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #3
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r5, [r5]
	lsls r1, r5, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
_08048C9C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048CA4: .4byte 0x08B9A560

	thumb_func_start sub_08048CA8
sub_08048CA8: @ 0x08048CA8
	push {lr}
	ldr r0, _08048CC4 @ =0x081C9D88
	ldr r1, _08048CC8 @ =0x06002000
	bl Decompress
	ldr r0, _08048CCC @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #1
	beq _08048CF4
	cmp r0, #1
	bgt _08048CD0
	cmp r0, #0
	beq _08048CDA
	b _08048D3E
	.align 2, 0
_08048CC4: .4byte 0x081C9D88
_08048CC8: .4byte 0x06002000
_08048CCC: .4byte 0x0202BBF8
_08048CD0:
	cmp r0, #2
	beq _08048D0C
	cmp r0, #3
	beq _08048D2C
	b _08048D3E
_08048CDA:
	ldr r0, _08048CE8 @ =0x081C8AB4
	ldr r1, _08048CEC @ =0x06002800
	bl Decompress
	ldr r0, _08048CF0 @ =0x081C9EE8
	b _08048D16
	.align 2, 0
_08048CE8: .4byte 0x081C8AB4
_08048CEC: .4byte 0x06002800
_08048CF0: .4byte 0x081C9EE8
_08048CF4:
	ldr r0, _08048D00 @ =0x081C8F64
	ldr r1, _08048D04 @ =0x06002800
	bl Decompress
	ldr r0, _08048D08 @ =0x081C9F28
	b _08048D16
	.align 2, 0
_08048D00: .4byte 0x081C8F64
_08048D04: .4byte 0x06002800
_08048D08: .4byte 0x081C9F28
_08048D0C:
	ldr r0, _08048D20 @ =0x081C9424
	ldr r1, _08048D24 @ =0x06002800
	bl Decompress
	ldr r0, _08048D28 @ =0x081C9F08
_08048D16:
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08048D3E
	.align 2, 0
_08048D20: .4byte 0x081C9424
_08048D24: .4byte 0x06002800
_08048D28: .4byte 0x081C9F08
_08048D2C:
	ldr r0, _08048D50 @ =0x081C98D4
	ldr r1, _08048D54 @ =0x06002800
	bl Decompress
	ldr r0, _08048D58 @ =0x081C9F48
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
_08048D3E:
	ldr r2, _08048D5C @ =0x0300144C
	ldr r1, _08048D60 @ =0x0202BBF8
	ldrb r0, [r1, #0xf]
	str r0, [r2]
	movs r0, #0
	strb r0, [r1, #0xf]
	pop {r0}
	bx r0
	.align 2, 0
_08048D50: .4byte 0x081C98D4
_08048D54: .4byte 0x06002800
_08048D58: .4byte 0x081C9F48
_08048D5C: .4byte 0x0300144C
_08048D60: .4byte 0x0202BBF8

	thumb_func_start sub_08048D64
sub_08048D64: @ 0x08048D64
	push {r4, lr}
	ldr r1, _08048DD4 @ =0x0202BBF8
	ldr r0, _08048DD8 @ =0x0300144C
	ldr r0, [r0]
	movs r2, #0
	strb r0, [r1, #0xf]
	ldr r3, _08048DDC @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r4, [r1]
	ands r0, r4
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r4, [r3, #0x10]
	ands r0, r4
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048DD4: .4byte 0x0202BBF8
_08048DD8: .4byte 0x0300144C
_08048DDC: .4byte 0x03002870

	thumb_func_start sub_08048DE0
sub_08048DE0: @ 0x08048DE0
	push {lr}
	ldr r1, _08048DF0 @ =0x03005D20
	movs r0, #0x49
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0
_08048DF0: .4byte 0x03005D20

	thumb_func_start sub_08048DF4
sub_08048DF4: @ 0x08048DF4
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, #0
	beq _08048E0A
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_08048E0A:
	bx lr

	thumb_func_start sub_08048E0C
sub_08048E0C: @ 0x08048E0C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_08048E12:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08048DF4
	adds r4, #1
	cmp r4, #4
	ble _08048E12
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08048E28
sub_08048E28: @ 0x08048E28
	push {r4, r5, r6, lr}
	ldr r5, _08048E6C @ =0x081C80E4
	ldr r0, _08048E70 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048E66
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08048E74 @ =0x02022860
	movs r4, #0xf
	ldr r6, _08048E78 @ =0x00000322
	adds r3, r0, r6
_08048E4E:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _08048E4E
	bl EnablePalSync
_08048E66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048E6C: .4byte 0x081C80E4
_08048E70: .4byte 0x0203DCE8
_08048E74: .4byte 0x02022860
_08048E78: .4byte 0x00000322

	thumb_func_start sub_08048E7C
sub_08048E7C: @ 0x08048E7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	mov sl, r1
_08048E94:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	movs r0, #0xf
	mov r4, sb
	ands r0, r4
	lsls r0, r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, _08049048 @ =0x081D55FE
	bl PutSprite
	ldr r4, _0804904C @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r2, _08049050 @ =0x080C5A48
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r4, _08049050 @ =0x080C5A48
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _0804904C @ =0x080C5AC8
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [r7, #0x38]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08048FBE
	adds r3, r7, #0
	adds r3, #0x3c
	cmp r1, sb
	beq _08048F44
	mov r4, sl
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	bls _08048F3E
	subs r0, #8
	strh r0, [r1]
_08048F3E:
	ldr r0, [r7, #0x38]
	cmp r0, sb
	bne _08048F56
_08048F44:
	mov r4, sl
	adds r2, r3, r4
	ldrh r1, [r2]
	ldr r0, _08049054 @ =0x0000014F
	cmp r1, r0
	bhi _08048F56
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r2]
_08048F56:
	ldr r1, _0804904C @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	add r3, sl
	mov r8, r3
	ldrh r1, [r3]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r3, _08049050 @ =0x080C5A48
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r3, _08049050 @ =0x080C5A48
	movs r4, #0
	ldrsh r0, [r3, r4]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _0804904C @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_08048FBE:
	ldr r1, [r7, #0x2c]
	subs r1, #0x30
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	ldr r3, _08049058 @ =0x08B9A5D0
	mov r4, sb
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [sp, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	movs r1, #2
	add sl, r1
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #3
	bgt _08048FF2
	b _08048E94
_08048FF2:
	ldr r2, [r7, #0x34]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _08049036
	ldr r1, [r7, #0x2c]
	subs r1, #0x40
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #8
	ldr r3, _0804905C @ =0x081D5744
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, #0x40
	ldr r2, [r7, #0x34]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #0x12
	ldr r3, _08049060 @ =0x081D574C
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_08048E28
_08049036:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049048: .4byte 0x081D55FE
_0804904C: .4byte 0x080C5AC8
_08049050: .4byte 0x080C5A48
_08049054: .4byte 0x0000014F
_08049058: .4byte 0x08B9A5D0
_0804905C: .4byte 0x081D5744
_08049060: .4byte 0x081D574C

	thumb_func_start StartLinkArenaVersusSpriteDraw
StartLinkArenaVersusSpriteDraw: @ 0x08049064
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _080490B0 @ =0x08B9A5E0
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	adds r1, r0, #0
	str r6, [r1, #0x2c]
	mov r0, r8
	str r0, [r1, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x34]
	str r0, [r1, #0x38]
	movs r3, #0x80
	lsls r3, r3, #1
	movs r2, #3
	adds r0, r1, #0
	adds r0, #0x42
_0804909A:
	strh r3, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0804909A
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080490B0: .4byte 0x08B9A5E0

	thumb_func_start sub_080490B4
sub_080490B4: @ 0x080490B4
	push {lr}
	ldr r0, _080490C0 @ =0x08B9A5E0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080490C0: .4byte 0x08B9A5E0

	thumb_func_start sub_080490C4
sub_080490C4: @ 0x080490C4
	push {lr}
	ldr r0, _080490D0 @ =0x08B9A5E0
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080490D0: .4byte 0x08B9A5E0

	thumb_func_start sub_080490D4
sub_080490D4: @ 0x080490D4
	push {r4, r5, lr}
	ldr r5, _08049118 @ =0x081C80E4
	ldr r0, _0804911C @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08049112
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08049120 @ =0x02022860
	movs r4, #0xf
	adds r3, r0, #0
	adds r3, #0x42
_080490FA:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _080490FA
	bl EnablePalSync
_08049112:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049118: .4byte 0x081C80E4
_0804911C: .4byte 0x0203DCE8
_08049120: .4byte 0x02022860

	thumb_func_start sub_08049124
sub_08049124: @ 0x08049124
	push {r4, r5, r6, lr}
	ldr r5, _08049168 @ =0x081C80E4
	ldr r0, _0804916C @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08049162
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _08049170 @ =0x02022860
	movs r4, #0xf
	ldr r6, _08049174 @ =0x00000262
	adds r3, r0, r6
_0804914A:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804914A
	bl EnablePalSync
_08049162:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049168: .4byte 0x081C80E4
_0804916C: .4byte 0x0203DCE8
_08049170: .4byte 0x02022860
_08049174: .4byte 0x00000262

	thumb_func_start sub_08049178
sub_08049178: @ 0x08049178
	ldr r3, _080491B8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080491BC @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _080491C0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_080491B8: .4byte 0x03002870
_080491BC: .4byte 0x0000FFE0
_080491C0: .4byte 0x0000E0FF

	thumb_func_start sub_080491C4
sub_080491C4: @ 0x080491C4
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, [r1, #0x30]
	adds r0, r2, #0
	subs r0, #0x1f
	cmp r0, #0x79
	bhi _080491E6
	ldr r1, [r1, #0x2c]
	ldr r3, _080491EC @ =0x081D575A
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_08049124
_080491E6:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080491EC: .4byte 0x081D575A

	thumb_func_start sub_080491F0
sub_080491F0: @ 0x080491F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804921C @ =0x08B9A5F0
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804921C: .4byte 0x08B9A5F0

	thumb_func_start sub_08049220
sub_08049220: @ 0x08049220
	push {r4, lr}
	ldr r0, _0804924C @ =0x084120A0
	ldr r4, _08049250 @ =0x0200118C
	adds r1, r4, #0
	bl Decompress
	ldr r1, _08049254 @ =0x06016800
	adds r0, r4, #0
	movs r2, #6
	movs r3, #4
	bl sub_08047CB8
	ldr r0, _08049258 @ =0x084138F0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804924C: .4byte 0x084120A0
_08049250: .4byte 0x0200118C
_08049254: .4byte 0x06016800
_08049258: .4byte 0x084138F0

	thumb_func_start sub_0804925C
sub_0804925C: @ 0x0804925C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _0804927C @ =0x081D578C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804927C: .4byte 0x081D578C

	thumb_func_start sub_08049280
sub_08049280: @ 0x08049280
	push {r4, r5, lr}
	ldr r5, _080492AC @ =0x03004690
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080492C2
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _080492B0
	movs r0, #2
	b _080492C4
	.align 2, 0
_080492AC: .4byte 0x03004690
_080492B0:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080492C2
	movs r0, #1
	b _080492C4
_080492C2:
	movs r0, #3
_080492C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080492CC
sub_080492CC: @ 0x080492CC
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _080492E8
	ldr r0, _080492E4 @ =0x0203DC9C
	adds r1, #0x3c
	ldrb r1, [r1]
	strb r1, [r0, #7]
	movs r0, #0x84
	b _080492EA
	.align 2, 0
_080492E4: .4byte 0x0203DC9C
_080492E8:
	movs r0, #8
_080492EA:
	bx lr

	thumb_func_start sub_080492EC
sub_080492EC: @ 0x080492EC
	ldr r2, _080492FC @ =0x0203DC9C
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r2, #6]
	movs r0, #0x17
	bx lr
	.align 2, 0
_080492FC: .4byte 0x0203DC9C

	thumb_func_start sub_08049300
sub_08049300: @ 0x08049300
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _0804935C @ =0x03004690
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	adds r1, r6, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804932E
	movs r5, #0
_0804932E:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r1, [r4, r5]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08049360 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r6, #0
	bl DrawItemMenuLine
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804935C: .4byte 0x03004690
_08049360: .4byte 0x02022C60

	thumb_func_start sub_08049364
sub_08049364: @ 0x08049364
	ldr r1, _08049370 @ =0x0203DC9C
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #0x1b
	bx lr
	.align 2, 0
_08049370: .4byte 0x0203DC9C

	thumb_func_start sub_08049374
sub_08049374: @ 0x08049374
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r1, _080493DC @ =0x0203DC9C
	movs r0, #0
	strb r0, [r1, #6]
	adds r7, r2, #0
	adds r7, #0x2d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x2c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080493E0 @ =0x02022C60
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x2e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x2f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080493E4 @ =0x02023460
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080493DC: .4byte 0x0203DC9C
_080493E0: .4byte 0x02022C60
_080493E4: .4byte 0x02023460

	thumb_func_start MultiBootInit
MultiBootInit: @ 0x080493E8
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _08049414 @ =0x04000134
	strh r1, [r0]
	ldr r2, _08049418 @ =0x04000128
	ldr r3, _0804941C @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08049420 @ =0x0400012A
	strh r1, [r0]
	bx lr
	.align 2, 0
_08049414: .4byte 0x04000134
_08049418: .4byte 0x04000128
_0804941C: .4byte 0x00002003
_08049420: .4byte 0x0400012A

	thumb_func_start sub_08049424
sub_08049424: @ 0x08049424
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_08049944
	cmp r0, #0
	beq _0804943A
	b _08049800
_0804943A:
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _0804944E
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _08049800
_0804944E:
	adds r1, r6, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _08049478
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08049474 @ =0x04000128
	ldrh r0, [r0]
	movs r4, #0xfc
	ands r4, r0
	cmp r4, #8
	beq _08049478
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #8
	eors r0, r4
	b _08049802
	.align 2, 0
_08049474: .4byte 0x04000128
_08049478:
	ldrb r2, [r6, #0x18]
	cmp r2, #0xdf
	bls _080494CA
	adds r0, r6, #0
	bl sub_08049954
	adds r4, r0, #0
	cmp r4, #0
	beq _0804948C
	b _08049802
_0804948C:
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _080494A8
	ldrb r0, [r6, #0x18]
	cmp r0, #0xe1
	bls _080494A8
	adds r0, r6, #0
	bl sub_08049944
	cmp r0, #0
	bne _080494A8
	b _080497F0
_080494A8:
	adds r0, r6, #0
	bl sub_08049944
	cmp r0, #0
	beq _080494B4
	b _08049800
_080494B4:
	ldrh r0, [r6, #0x16]
	cmp r0, #0
	bne _080494C4
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #0x71
	b _08049802
_080494C4:
	subs r0, #1
	strh r0, [r6, #0x16]
	b _08049800
_080494CA:
	ldrb r0, [r6, #0x18]
	cmp r0, #2
	bne _080494D2
	b _08049608
_080494D2:
	cmp r0, #2
	bgt _080494E0
	cmp r0, #0
	beq _080494EE
	cmp r0, #1
	beq _080495AC
	b _08049744
_080494E0:
	cmp r0, #0xd0
	bne _080494E6
	b _08049654
_080494E6:
	cmp r0, #0xd1
	bne _080494EC
	b _080496F0
_080494EC:
	b _08049744
_080494EE:
	movs r5, #0xe
	movs r4, #3
	ldr r0, _08049534 @ =0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _08049538 @ =0x0000FFFF
	ldrb r2, [r6, #0x1e]
	adds r7, r2, #0
	cmp r1, r0
	bne _08049516
	adds r3, r1, #0
	ldr r1, _0804953C @ =0x04000126
_08049506:
	asrs r5, r5, #1
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	beq _08049516
	ldrh r0, [r1]
	cmp r0, r3
	beq _08049506
_08049516:
	movs r0, #0xe
	ands r5, r0
	strb r5, [r6, #0x1d]
	movs r4, #3
	ldr r0, _08049534 @ =0x04000120
	ldrh r0, [r0, #6]
	adds r3, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08049544
	ldr r0, _08049540 @ =0x00007208
	b _0804956A
	.align 2, 0
_08049534: .4byte 0x04000120
_08049538: .4byte 0x0000FFFF
_0804953C: .4byte 0x04000126
_08049540: .4byte 0x00007208
_08049544:
	subs r4, #1
	cmp r4, #0
	beq _08049570
	lsls r0, r4, #1
	ldr r1, _08049598 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, #0
	adds r0, r2, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08049544
	adds r0, r1, #0
	lsls r0, r4
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_0804956A:
	cmp r3, r0
	beq _08049544
	movs r5, #0
_08049570:
	adds r0, r5, #0
	ands r0, r7
	strb r0, [r6, #0x1e]
	cmp r5, #0
	bne _08049580
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_08049580:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804959C
	ldrb r2, [r6, #0x1d]
	ldrb r0, [r6, #0x1e]
	cmp r2, r0
	beq _080495A2
	adds r0, r6, #0
	bl MultiBootStartProbe
	b _080495AC
	.align 2, 0
_08049598: .4byte 0x04000120
_0804959C:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_080495A2:
	movs r2, #0xc4
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r6, #0x1e]
	b _080496AC
_080495AC:
	adds r1, r6, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r4, #3
	adds r7, r1, #0
	ldr r5, _08049600 @ =0x03001450
_080495BA:
	lsls r0, r4, #1
	ldr r2, _08049604 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	asrs r0, r3, #8
	subs r2, r4, #1
	cmp r0, #0x72
	bne _080495E4
	lsls r0, r2, #1
	adds r0, r0, r5
	strh r3, [r0]
	movs r0, #0xff
	ands r3, r0
	movs r0, #1
	lsls r0, r4
	cmp r3, r0
	bne _080495E4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
_080495E4:
	adds r4, r2, #0
	cmp r4, #0
	bne _080495BA
	ldrb r1, [r6, #0x1d]
	ldrb r2, [r7]
	cmp r1, r2
	bne _080495A2
	movs r0, #2
	strb r0, [r6, #0x18]
	movs r1, #0xc2
	lsls r1, r1, #7
	adds r0, r1, #0
	ldrb r1, [r7]
	b _080496AC
	.align 2, 0
_08049600: .4byte 0x03001450
_08049604: .4byte 0x04000120
_08049608:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	adds r5, r7, #0
	movs r2, #1
	mov ip, r2
	ldr r0, _0804964C @ =0x03001450
	mov sb, r0
	ldr r1, _08049650 @ =0x04000120
	mov r8, r1
_0804961C:
	ldrb r3, [r5]
	adds r0, r3, #0
	asrs r0, r4
	mov r2, ip
	ands r0, r2
	subs r2, r4, #1
	cmp r0, #0
	beq _08049644
	lsls r0, r4, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, sb
	ldrh r0, [r0]
	cmp r1, r0
	beq _08049644
	mov r0, ip
	lsls r0, r4
	eors r3, r0
	strb r3, [r5]
_08049644:
	adds r4, r2, #0
	cmp r4, #0
	bne _0804961C
	b _080497A8
	.align 2, 0
_0804964C: .4byte 0x03001450
_08049650: .4byte 0x04000120
_08049654:
	movs r5, #1
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	movs r0, #0x19
	adds r0, r0, r6
	mov ip, r0
	ldr r1, _080496B8 @ =0x03001450
	mov r8, r1
_08049666:
	lsls r0, r4, #1
	ldr r2, _080496BC @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	subs r2, r4, #1
	mov r1, ip
	adds r0, r1, r2
	strb r3, [r0]
	ldrb r1, [r7]
	asrs r1, r4
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0804969A
	asrs r0, r3, #8
	subs r0, #0x72
	cmp r0, #1
	bls _0804968E
	b _080497F6
_0804968E:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r3, r0
	bne _0804969A
	movs r5, #0
_0804969A:
	adds r4, r2, #0
	cmp r4, #0
	bne _08049666
	cmp r5, #0
	bne _080496C0
	movs r2, #0xc6
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r6, #0x1c]
_080496AC:
	orrs r1, r0
	adds r0, r6, #0
	bl MultiBootSend
	b _08049802
	.align 2, 0
_080496B8: .4byte 0x03001450
_080496BC: .4byte 0x04000120
_080496C0:
	movs r0, #0xd1
	strb r0, [r6, #0x18]
	movs r5, #0x11
	movs r4, #3
	mov r0, ip
	adds r0, #2
_080496CC:
	ldrb r1, [r0]
	adds r5, r1, r5
	subs r0, #1
	subs r4, #1
	cmp r4, #0
	bne _080496CC
	strb r5, [r6, #0x14]
	movs r0, #0xff
	ands r5, r0
	movs r2, #0xc8
	lsls r2, r2, #7
	adds r0, r2, #0
	orrs r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl MultiBootSend
	b _08049802
_080496F0:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	ldrb r1, [r7]
	ldr r2, _08049730 @ =0x04000126
	movs r5, #1
_080496FC:
	ldrh r0, [r2]
	adds r3, r0, #0
	adds r0, r1, #0
	asrs r0, r4
	ands r0, r5
	cmp r0, #0
	beq _08049710
	asrs r0, r3, #8
	cmp r0, #0x73
	bne _080497F6
_08049710:
	subs r2, #2
	subs r4, #1
	cmp r4, #0
	bne _080496FC
	adds r0, r6, #0
	bl MultiBoot
	adds r4, r0, #0
	cmp r4, #0
	bne _08049734
	movs r0, #0xe0
	strb r0, [r6, #0x18]
	adds r0, #0xb0
	strh r0, [r6, #0x16]
	b _08049800
	.align 2, 0
_08049730: .4byte 0x04000126
_08049734:
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _08049802
_08049744:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	mov ip, r7
	movs r2, #1
	mov r8, r2
_08049750:
	mov r0, ip
	ldrb r5, [r0]
	adds r0, r5, #0
	asrs r0, r4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0804978A
	lsls r0, r4, #1
	ldr r2, _080497A4 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	asrs r2, r3, #8
	ldrb r0, [r6, #0x18]
	lsrs r1, r0, #1
	movs r0, #0x62
	subs r0, r0, r1
	mov r1, r8
	lsls r1, r4
	cmp r2, r0
	bne _08049784
	movs r0, #0xff
	ands r3, r0
	cmp r3, r1
	beq _0804978A
_08049784:
	eors r5, r1
	mov r1, ip
	strb r5, [r1]
_0804978A:
	subs r4, #1
	cmp r4, #0
	bne _08049750
	ldrb r2, [r6, #0x18]
	cmp r2, #0xc4
	bne _080497A8
	movs r0, #0xe
	ldrb r7, [r7]
	ands r0, r7
	strb r0, [r6, #0x1e]
	strb r4, [r6, #0x18]
	b _080495A2
	.align 2, 0
_080497A4: .4byte 0x04000120
_080497A8:
	ldrb r0, [r7]
	cmp r0, #0
	bne _080497B8
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #0x50
	b _08049802
_080497B8:
	ldrb r0, [r6, #0x18]
	adds r0, #2
	strb r0, [r6, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _080497C8
	b _080495A2
_080497C8:
	ldr r0, [r6, #0x28]
	ldrb r1, [r6, #0x18]
	adds r0, r1, r0
	subs r1, r0, #3
	ldrb r1, [r1]
	lsls r1, r1, #8
	subs r0, #4
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r6, #0
	bl MultiBootSend
	adds r4, r0, #0
	cmp r4, #0
	bne _08049802
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08049800
_080497F0:
	bl MultiBootWaitSendDone
	b _0804944E
_080497F6:
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #0x60
	b _08049802
_08049800:
	movs r0, #0
_08049802:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start MultiBootSend
MultiBootSend: @ 0x08049810
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804983C @ =0x04000128
	ldrh r0, [r3]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne _08049848
	ldr r0, _08049840 @ =0x0400012A
	strh r1, [r0]
	ldr r1, _08049844 @ =0x00002083
	adds r0, r1, #0
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _08049854
	.align 2, 0
_0804983C: .4byte 0x04000128
_08049840: .4byte 0x0400012A
_08049844: .4byte 0x00002083
_08049848:
	adds r0, r2, #0
	bl MultiBootInit
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
_08049854:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MultiBootStartProbe
MultiBootStartProbe: @ 0x0804985C
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _0804986E
	adds r0, r1, #0
	bl MultiBootInit
	b _0804987A
_0804986E:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
_0804987A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08049880
sub_08049880: @ 0x08049880
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r3, #0
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080498BC
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080498BC
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _080498BC
	str r6, [r4, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _080498C4 @ =0x0003FF00
	cmp r1, r0
	bls _080498C8
_080498BC:
	adds r0, r4, #0
	bl MultiBootInit
	b _0804993C
	.align 2, 0
_080498C4: .4byte 0x0003FF00
_080498C8:
	adds r0, r6, r2
	str r0, [r4, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _08049928
	lsls r0, r0, #2
	ldr r1, _080498E8 @ =_080498EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080498E8: .4byte _080498EC
_080498EC: @ jump table
	.4byte _08049910 @ case 0
	.4byte _08049910 @ case 1
	.4byte _08049910 @ case 2
	.4byte _08049910 @ case 3
	.4byte _0804991A @ case 4
	.4byte _08049920 @ case 5
	.4byte _08049920 @ case 6
	.4byte _08049920 @ case 7
	.4byte _08049920 @ case 8
_08049910:
	lsls r3, r5, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _08049926
_0804991A:
	movs r0, #0x38
	adds r3, r5, #0
	b _08049926
_08049920:
	lsls r3, r5, #3
	asrs r0, r2, #0x18
	subs r0, #1
_08049926:
	orrs r3, r0
_08049928:
	movs r0, #0x3f
	ands r3, r0
	lsls r0, r3, #1
	movs r2, #0x7f
	rsbs r2, r2, #0
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r4, #0x1c]
	movs r0, #0xd0
	strb r0, [r4, #0x18]
_0804993C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08049944
sub_08049944: @ 0x08049944
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _0804994E
	movs r0, #0
	b _08049950
_0804994E:
	movs r0, #1
_08049950:
	bx lr
	.align 2, 0

	thumb_func_start sub_08049954
sub_08049954: @ 0x08049954
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _08049970
	cmp r0, #0xe0
	blt _08049980
	cmp r0, #0xe8
	bgt _08049980
	cmp r0, #0xe7
	blt _08049980
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _080499E0
_08049970:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _080499D2
_08049980:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _080499DC @ =0x04000126
_08049988:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _0804999C
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _08049970
_0804999C:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _08049988
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _080499CA
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrb r1, [r1]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r0, #5
	str r0, [r3]
_080499CA:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_080499D0:
	ldrh r1, [r3]
_080499D2:
	adds r0, r3, #0
	bl MultiBootSend
	b _08049A38
	.align 2, 0
_080499DC: .4byte 0x04000126
_080499E0:
	lsls r0, r4, #1
	ldr r1, _08049A28 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080499FC
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _08049A2C
_080499FC:
	subs r4, #1
	cmp r4, #0
	bne _080499E0
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _08049A36
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrb r1, [r1]
	orrs r0, r1
	str r0, [r3]
	str r0, [r3, #4]
	b _080499D0
	.align 2, 0
_08049A28: .4byte 0x04000120
_08049A2C:
	adds r0, r3, #0
	bl MultiBootInit
	movs r0, #0x71
	b _08049A38
_08049A36:
	movs r0, #0
_08049A38:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MultiBootWaitCycles
MultiBootWaitCycles: @ 0x08049A40
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _08049A52
	movs r1, #0xd
	cmp r2, #8
	beq _08049A52
	movs r1, #4
_08049A52:
	subs r0, r0, r1
	bgt _08049A52
	bx lr

	thumb_func_start MultiBootWaitSendDone
MultiBootWaitSendDone: @ 0x08049A58
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _08049A8C @ =0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08049A7C
	ldr r5, _08049A90 @ =0x0000795C
	movs r4, #0x80
_08049A6C:
	adds r2, #1
	cmp r2, r5
	bgt _08049A7C
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08049A6C
_08049A7C:
	movs r0, #0x96
	lsls r0, r0, #2
	bl MultiBootWaitCycles
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049A8C: .4byte 0x04000128
_08049A90: .4byte 0x0000795C
