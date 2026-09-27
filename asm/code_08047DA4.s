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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl SpawnProc
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
	bl TmFillRect_t
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
	bl TmFillRect_t
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

	thumb_func_start ApplyUiWindowFramePal
ApplyUiWindowFramePal: @ 0x08049A94
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bge _08049A9E
	movs r3, #1
_08049A9E:
	ldr r2, _08049ABC @ =0x08B9A830
	ldr r1, _08049AC0 @ =0x0202BBF8
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r3, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08049ABC: .4byte 0x08B9A830
_08049AC0: .4byte 0x0202BBF8

	thumb_func_start UnpackUiWindowFrameImg
UnpackUiWindowFrameImg: @ 0x08049AC4
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _08049AD0
	movs r3, #0xc0
	lsls r3, r3, #0x13
_08049AD0:
	ldr r2, _08049AEC @ =0x08B9A840
	ldr r1, _08049AF0 @ =0x0202BBF8
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r3, #0
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08049AEC: .4byte 0x08B9A840
_08049AF0: .4byte 0x0202BBF8

	thumb_func_start ApplyUiStatBarPal
ApplyUiStatBarPal: @ 0x08049AF4
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bge _08049AFE
	movs r3, #6
_08049AFE:
	ldr r2, _08049B1C @ =0x08B9A850
	ldr r1, _08049B20 @ =0x0202BBF8
	adds r1, #0x41
	movs r0, #0xc
	ldrb r1, [r1]
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r3, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08049B1C: .4byte 0x08B9A850
_08049B20: .4byte 0x0202BBF8

	thumb_func_start UnpackUiWindowFrameGraphics2
UnpackUiWindowFrameGraphics2: @ 0x08049B24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	cmp r5, #0
	bge _08049B36
	ldr r0, _08049B6C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1e
_08049B36:
	ldr r0, _08049B70 @ =0x08B9A840
	lsls r5, r5, #2
	adds r5, r5, r0
	ldr r0, [r5]
	bl GetDataSize
	adds r6, r0, #0
	ldr r4, _08049B74 @ =0x02022240
	subs r4, r4, r6
	ldr r0, [r5]
	adds r1, r4, #0
	bl Decompress
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r6, #0
	bl RegisterDataMove
	movs r0, #1
	rsbs r0, r0, #0
	bl ApplyUiWindowFramePal
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049B6C: .4byte 0x0202BBF8
_08049B70: .4byte 0x08B9A840
_08049B74: .4byte 0x02022240

	thumb_func_start PutUiWindowFrame
PutUiWindowFrame: @ 0x08049B78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	str r1, [sp]
	str r2, [sp, #4]
	ldr r2, [sp, #0x34]
	ldr r6, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	ldr r1, _08049CE0 @ =0x08B9A824
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r0, [sp]
	adds r3, r0, r3
	subs r3, #1
	mov r8, r3
	ldr r1, [sp, #4]
	adds r2, r1, r2
	subs r2, #1
	mov sl, r2
	adds r4, r1, #0
	adds r4, #1
	cmp r4, sl
	bge _08049BFA
_08049BB0:
	ldr r3, [sp]
	adds r3, #1
	adds r2, r4, #2
	str r2, [sp, #0x10]
	cmp r3, r8
	bge _08049BF4
	lsls r1, r3, #0x10
	lsls r0, r4, #0x15
	adds r4, r1, r0
	movs r7, #0x80
	lsls r7, r7, #0xa
	mov ip, r7
_08049BC8:
	lsrs r0, r4, #0x10
	lsls r0, r0, #1
	add r0, sb
	ldrh r2, [r5, #0xa]
	adds r1, r2, r6
	strh r1, [r0]
	ldrh r7, [r5, #0xc]
	adds r1, r7, r6
	strh r1, [r0, #2]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r7, [r5, #0x12]
	adds r1, r7, r6
	strh r1, [r2]
	adds r0, #0x42
	ldrh r2, [r5, #0x14]
	adds r1, r2, r6
	strh r1, [r0]
	add r4, ip
	adds r3, #2
	cmp r3, r8
	blt _08049BC8
_08049BF4:
	ldr r4, [sp, #0x10]
	cmp r4, sl
	blt _08049BB0
_08049BFA:
	ldr r3, [sp]
	adds r3, #1
	ldr r2, [sp, #4]
	adds r2, #1
	ldr r4, [sp, #4]
	lsls r4, r4, #5
	str r4, [sp, #8]
	mov r7, sl
	lsls r7, r7, #5
	str r7, [sp, #0xc]
	cmp r3, r8
	bge _08049C46
	lsls r0, r3, #1
	mov r4, sl
	lsls r1, r4, #6
	add r1, sb
	adds r4, r0, r1
	ldr r7, [sp, #4]
	lsls r1, r7, #6
	add r1, sb
	adds r1, r0, r1
_08049C24:
	ldrh r7, [r5, #2]
	adds r0, r7, r6
	strh r0, [r1]
	ldrh r7, [r5, #4]
	adds r0, r7, r6
	strh r0, [r1, #2]
	ldrh r7, [r5, #0x1a]
	adds r0, r7, r6
	strh r0, [r4]
	ldrh r7, [r5, #0x1c]
	adds r0, r7, r6
	strh r0, [r4, #2]
	adds r4, #4
	adds r1, #4
	adds r3, #2
	cmp r3, r8
	blt _08049C24
_08049C46:
	adds r4, r2, #0
	cmp r4, sl
	bge _08049C96
	lsls r3, r4, #6
	mov r0, r8
	lsls r2, r0, #1
	mov r0, sb
	adds r0, #0x40
	adds r1, r2, r0
	adds r1, r1, r3
	mov ip, r1
	ldr r7, [sp]
	lsls r1, r7, #1
	adds r0, r1, r0
	adds r7, r3, r0
	add r2, sb
	adds r2, r3, r2
	add r1, sb
	adds r3, r3, r1
_08049C6C:
	ldrh r1, [r5, #8]
	adds r0, r1, r6
	strh r0, [r3]
	ldrh r1, [r5, #0xe]
	adds r0, r1, r6
	strh r0, [r2]
	ldrh r1, [r5, #0x10]
	adds r0, r1, r6
	strh r0, [r7]
	ldrh r1, [r5, #0x16]
	adds r0, r1, r6
	mov r1, ip
	strh r0, [r1]
	movs r0, #0x80
	add ip, r0
	adds r7, #0x80
	adds r2, #0x80
	adds r3, #0x80
	adds r4, #2
	cmp r4, sl
	blt _08049C6C
_08049C96:
	ldr r1, [sp, #8]
	ldr r2, [sp]
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r4, [r5]
	adds r1, r4, r6
	strh r1, [r0]
	ldr r0, [sp, #8]
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	ldrh r7, [r5, #6]
	adds r1, r7, r6
	strh r1, [r0]
	ldr r1, [sp, #0xc]
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r2, [r5, #0x18]
	adds r1, r2, r6
	strh r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r8
	lsls r0, r0, #1
	add r0, sb
	ldrh r5, [r5, #0x1e]
	adds r1, r5, r6
	strh r1, [r0]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049CE0: .4byte 0x08B9A824

	thumb_func_start DrawUiFrame2
DrawUiFrame2: @ 0x08049CE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	str r0, [sp]
	mov sb, r1
	ldr r0, [sp, #0x50]
	ldr r1, _08049F4C @ =0x08B9A824
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r0, [sp]
	adds r2, r0, r2
	subs r2, #1
	str r2, [sp, #4]
	add r3, sb
	subs r3, #1
	str r3, [sp, #8]
	mov r4, sb
	adds r4, #1
	cmp r4, r3
	bge _08049D8E
	ldr r1, _08049F50 @ =0x02023460
	mov sl, r1
_08049D18:
	ldr r7, [sp]
	adds r7, #1
	adds r2, r4, #2
	mov r8, r2
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _08049D86
	ldr r1, _08049F54 @ =0x02022C60
	mov ip, r1
	movs r5, #0
	mov r3, sl
_08049D2E:
	lsls r0, r4, #5
	adds r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0xa]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0xc]
	strh r1, [r2]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r0, #1
	mov r1, ip
	adds r1, r2, r1
	strh r5, [r1]
	adds r2, r2, r3
	ldrh r1, [r6, #0x12]
	strh r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	mov r2, ip
	adds r1, r0, r2
	strh r5, [r1]
	adds r0, r0, r3
	ldrh r1, [r6, #0x14]
	strh r1, [r0]
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _08049D2E
_08049D86:
	mov r4, r8
	ldr r1, [sp, #8]
	cmp r4, r1
	blt _08049D18
_08049D8E:
	ldr r7, [sp]
	adds r7, #1
	mov r2, sb
	adds r2, #1
	str r2, [sp, #0xc]
	mov r4, sb
	lsls r4, r4, #5
	str r4, [sp, #0x10]
	ldr r0, [sp, #8]
	lsls r0, r0, #5
	str r0, [sp, #0x14]
	ldr r1, [sp, #4]
	cmp r7, r1
	bge _08049E3E
	adds r5, r4, #0
	adds r5, #1
	adds r3, r0, #0
	adds r3, #1
	lsls r2, r7, #1
	ldr r4, [sp, #8]
	lsls r0, r4, #6
	ldr r4, _08049F50 @ =0x02023460
	adds r1, r0, r4
	adds r1, r2, r1
	str r1, [sp, #0x1c]
	ldr r1, _08049F54 @ =0x02022C60
	adds r0, r0, r1
	adds r0, r0, r2
	mov sl, r0
	mov r4, sb
	lsls r0, r4, #6
	ldr r4, _08049F50 @ =0x02023460
	adds r1, r0, r4
	adds r1, r1, r2
	mov sb, r1
	ldr r1, _08049F54 @ =0x02022C60
	adds r0, r0, r1
	adds r0, r0, r2
	mov r8, r0
	lsls r3, r3, #1
	adds r0, r3, r4
	adds r0, r0, r2
	mov ip, r0
	adds r3, r3, r1
	adds r1, r2, r3
	lsls r5, r5, #1
	adds r4, r5, r4
	str r4, [sp, #0x24]
	adds r3, r2, r4
	ldr r0, _08049F54 @ =0x02022C60
	adds r5, r5, r0
	adds r2, r2, r5
_08049DF6:
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r6, #2]
	mov r4, sb
	strh r0, [r4]
	movs r0, #0
	strh r0, [r2]
	ldrh r0, [r6, #4]
	strh r0, [r3]
	movs r0, #0
	mov r4, sl
	strh r0, [r4]
	ldrh r0, [r6, #0x1a]
	ldr r4, [sp, #0x1c]
	strh r0, [r4]
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r6, #0x1c]
	mov r4, ip
	strh r0, [r4]
	ldr r0, [sp, #0x1c]
	adds r0, #4
	str r0, [sp, #0x1c]
	movs r4, #4
	add sl, r4
	add sb, r4
	add r8, r4
	add ip, r4
	adds r1, #4
	adds r3, #4
	adds r2, #4
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _08049DF6
_08049E3E:
	ldr r4, [sp, #0xc]
	ldr r1, [sp, #8]
	cmp r4, r1
	bge _08049ED4
	movs r2, #0
	mov sl, r2
	ldr r5, _08049F50 @ =0x02023460
	lsls r2, r4, #5
	adds r2, #0x20
	ldr r7, [sp, #4]
	adds r7, r2, r7
	str r7, [sp, #0x18]
	ldr r0, [sp]
	adds r2, r2, r0
	lsls r3, r4, #6
	ldr r1, [sp, #4]
	lsls r0, r1, #1
	adds r1, r0, r5
	adds r1, r1, r3
	mov sb, r1
	ldr r7, _08049F54 @ =0x02022C60
	adds r0, r0, r7
	adds r0, r0, r3
	mov r8, r0
	ldr r1, [sp]
	lsls r0, r1, #1
	adds r1, r0, r5
	adds r1, r1, r3
	mov ip, r1
	adds r0, r0, r7
	adds r3, r3, r0
	lsls r2, r2, #1
	adds r7, r2, r5
	str r7, [sp, #0x2c]
	ldr r0, _08049F54 @ =0x02022C60
	adds r2, r2, r0
	ldr r1, [sp, #0x18]
	lsls r1, r1, #1
	str r1, [sp, #0x20]
	adds r5, r1, r5
	adds r1, r1, r0
_08049E90:
	mov r7, sl
	strh r7, [r3]
	ldrh r0, [r6, #8]
	mov r7, ip
	strh r0, [r7]
	mov r7, sl
	mov r0, r8
	strh r7, [r0]
	ldrh r0, [r6, #0xe]
	mov r7, sb
	strh r0, [r7]
	mov r0, sl
	strh r0, [r2]
	ldrh r0, [r6, #0x10]
	ldr r7, [sp, #0x2c]
	strh r0, [r7]
	mov r0, sl
	strh r0, [r1]
	ldrh r0, [r6, #0x16]
	strh r0, [r5]
	adds r5, #0x80
	adds r1, #0x80
	adds r7, #0x80
	str r7, [sp, #0x2c]
	adds r2, #0x80
	movs r0, #0x80
	add sb, r0
	add r8, r0
	add ip, r0
	adds r3, #0x80
	adds r4, #2
	ldr r7, [sp, #8]
	cmp r4, r7
	blt _08049E90
_08049ED4:
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	adds r5, r0, r1
	lsls r5, r5, #1
	ldr r2, _08049F54 @ =0x02022C60
	adds r0, r5, r2
	movs r7, #0
	strh r7, [r0]
	ldr r4, [sp, #0x10]
	ldr r0, [sp, #4]
	adds r3, r4, r0
	lsls r3, r3, #1
	adds r0, r3, r2
	strh r7, [r0]
	ldr r4, [sp, #0x14]
	adds r2, r4, r1
	lsls r2, r2, #1
	ldr r1, _08049F54 @ =0x02022C60
	adds r0, r2, r1
	strh r7, [r0]
	ldr r0, [sp, #4]
	adds r1, r4, r0
	lsls r1, r1, #1
	ldr r4, _08049F54 @ =0x02022C60
	adds r0, r1, r4
	strh r7, [r0]
	ldr r7, _08049F50 @ =0x02023460
	adds r5, r5, r7
	ldrh r0, [r6]
	strh r0, [r5]
	adds r3, r3, r7
	ldrh r0, [r6, #6]
	strh r0, [r3]
	adds r2, r2, r7
	ldrh r0, [r6, #0x18]
	strh r0, [r2]
	adds r1, r1, r7
	ldrh r0, [r6, #0x1e]
	strh r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	bl EnableBgSync
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049F4C: .4byte 0x08B9A824
_08049F50: .4byte 0x02023460
_08049F54: .4byte 0x02022C60

	thumb_func_start PutUiHand
PutUiHand: @ 0x08049F58
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetGameTime
	subs r0, #1
	ldr r7, _08049FB8 @ =0x0203DCF0
	ldr r1, [r7]
	cmp r0, r1
	bne _08049F80
	ldr r0, _08049FBC @ =0x0203DCEC
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r6, r0
	asrs r6, r0, #1
_08049F80:
	ldr r0, _08049FBC @ =0x0203DCEC
	movs r4, #0
	strh r5, [r0]
	strh r6, [r0, #2]
	bl GetGameTime
	str r0, [r7]
	bl GetGameTime
	adds r3, r5, #0
	subs r3, #0xe
	ldr r2, _08049FC0 @ =0x08B9A868
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r5, r1, r3
	ldr r3, _08049FC4 @ =0x08B9A860
	str r4, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049FB8: .4byte 0x0203DCF0
_08049FBC: .4byte 0x0203DCEC
_08049FC0: .4byte 0x08B9A868
_08049FC4: .4byte 0x08B9A860

	thumb_func_start PutUnkUiHand
PutUnkUiHand: @ 0x08049FC8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetGameTime
	adds r3, r5, #0
	subs r3, #0xe
	ldr r2, _08049FFC @ =0x08B9A868
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r5, r1, r3
	ldr r3, _0804A000 @ =0x08B9A860
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049FFC: .4byte 0x08B9A868
_0804A000: .4byte 0x08B9A860

	thumb_func_start DisplayFrozenUiHand
DisplayFrozenUiHand: @ 0x0804A004
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	subs r4, #0xc
	ldr r3, _0804A024 @ =0x08B9A860
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A024: .4byte 0x08B9A860

	thumb_func_start GetUiHandPrevX
GetUiHandPrevX: @ 0x0804A028
	ldr r0, _0804A030 @ =0x0203DCEC
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804A030: .4byte 0x0203DCEC

	thumb_func_start GetUiHandPrevY
GetUiHandPrevY: @ 0x0804A034
	ldr r0, _0804A03C @ =0x0203DCEC
	movs r1, #2
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804A03C: .4byte 0x0203DCEC

	thumb_func_start ClearUi
ClearUi: @ 0x0804A040
	push {lr}
	ldr r0, _0804A05C @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0804A060 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0804A05C: .4byte 0x02022C60
_0804A060: .4byte 0x02023460

	thumb_func_start DrawUiItemHover
DrawUiItemHover: @ 0x0804A064
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r2, r3, r2
	subs r5, r2, #1
	adds r4, #1
	ldr r2, _0804A0B8 @ =0x02023460
	lsls r0, r4, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _0804A0BC @ =0x0000106A
	strh r1, [r0]
	adds r3, #1
	adds r6, r2, #0
	cmp r3, r5
	bge _0804A09E
	ldr r2, _0804A0C0 @ =0x00001076
	lsls r1, r3, #1
	lsls r0, r4, #6
	adds r0, r0, r6
	adds r1, r1, r0
	subs r3, r5, r3
_0804A092:
	strh r2, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _0804A092
	adds r3, r5, #0
_0804A09E:
	lsls r0, r4, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, _0804A0C4 @ =0x0000106B
	strh r1, [r0]
	movs r0, #2
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A0B8: .4byte 0x02023460
_0804A0BC: .4byte 0x0000106A
_0804A0C0: .4byte 0x00001076
_0804A0C4: .4byte 0x0000106B

	thumb_func_start ClearUiItemHover
ClearUiItemHover: @ 0x0804A0C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r3, r0, #0
	adds r4, r1, #0
	mov sb, r2
	adds r0, r3, r2
	subs r5, r0, #1
	adds r4, #1
	ldr r0, _0804A128 @ =0x02023460
	mov r8, r0
	ldr r1, _0804A12C @ =0x081D581C
	mov ip, r1
	cmp r3, r5
	bge _0804A10C
	lsls r0, r4, #5
	ldrh r7, [r1, #0xc]
	adds r0, #1
	ldrh r6, [r1, #0xe]
	lsls r2, r3, #1
	lsls r1, r4, #6
	add r1, r8
	adds r1, r2, r1
	lsls r0, r0, #1
	add r0, r8
	adds r2, r2, r0
_0804A0FE:
	strh r7, [r1]
	strh r6, [r2]
	adds r1, #4
	adds r2, #4
	adds r3, #2
	cmp r3, r5
	blt _0804A0FE
_0804A10C:
	lsls r0, r4, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r0, r2
	movs r0, #1
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _0804A130
	mov r2, ip
	ldrh r0, [r2, #0xc]
	b _0804A134
	.align 2, 0
_0804A128: .4byte 0x02023460
_0804A12C: .4byte 0x081D581C
_0804A130:
	mov r2, ip
	ldrh r0, [r2, #0xe]
_0804A134:
	strh r0, [r1]
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UnpackUnkUiFrame
UnpackUnkUiFrame: @ 0x0804A148
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0804A16C @ =0x081D7B80
	adds r1, r3, #0
	bl Decompress
	ldr r0, _0804A170 @ =0x081D7DD4
	lsls r4, r4, #5
	lsls r5, r5, #5
	adds r1, r4, #0
	adds r2, r5, #0
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A16C: .4byte 0x081D7B80
_0804A170: .4byte 0x081D7DD4

	thumb_func_start DisplayUiHandExt
DisplayUiHandExt: @ 0x0804A174
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl GetGameTime
	subs r0, #1
	ldr r6, _0804A1D8 @ =0x0203DCF0
	ldr r1, [r6]
	cmp r0, r1
	bne _0804A19E
	ldr r0, _0804A1DC @ =0x0203DCEC
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r4, r1
	asrs r4, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r5, r0
	asrs r5, r0, #1
_0804A19E:
	ldr r0, _0804A1DC @ =0x0203DCEC
	strh r4, [r0]
	strh r5, [r0, #2]
	bl GetGameTime
	str r0, [r6]
	bl GetGameTime
	adds r3, r4, #0
	subs r3, #0xe
	ldr r2, _0804A1E0 @ =0x08B9A868
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r4, r1, r3
	ldr r3, _0804A1E4 @ =0x08B9A860
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A1D8: .4byte 0x0203DCF0
_0804A1DC: .4byte 0x0203DCEC
_0804A1E0: .4byte 0x08B9A868
_0804A1E4: .4byte 0x08B9A860

	thumb_func_start DisplayFrozenUiHandExt
DisplayFrozenUiHandExt: @ 0x0804A1E8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	subs r4, #0xc
	ldr r3, _0804A20C @ =0x08B9A860
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x14
	str r2, [sp]
	movs r0, #3
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A20C: .4byte 0x08B9A860

	thumb_func_start LoadUiFrameGraphics
LoadUiFrameGraphics: @ 0x0804A210
	push {lr}
	movs r0, #0
	bl UnpackUiWindowFrameImg
	movs r0, #1
	rsbs r0, r0, #0
	bl ApplyUiWindowFramePal
	pop {r0}
	bx r0

	thumb_func_start StartAdjustedMenu
StartAdjustedMenu: @ 0x0804A224
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	ldr r2, [r4]
	cmp r1, #0x77
	bgt _0804A234
	lsls r0, r3, #0x18
	b _0804A236
_0804A234:
	lsls r0, r0, #0x18
_0804A236:
	lsrs r0, r0, #0x18
	ldr r1, _0804A250 @ =0xFFFFFF00
	ands r2, r1
	orrs r2, r0
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0
	bl StartLockingMenuExt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804A250: .4byte 0xFFFFFF00

	thumb_func_start StartLockingMenu
StartLockingMenu: @ 0x0804A254
	push {lr}
	adds r2, r1, #0
	ldr r1, [r0]
	bl StartLockingMenuExt
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0804A264
sub_0804A264: @ 0x0804A264
	push {lr}
	movs r2, #0
	bl StartLockingMenuExt
	pop {r1}
	bx r1

	thumb_func_start StartMenu
StartMenu: @ 0x0804A270
	push {lr}
	ldr r1, [r0]
	movs r2, #0
	bl StartLockingMenuExt
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartLockingMenuExt
StartLockingMenuExt: @ 0x0804A280
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	mov sl, r1
	adds r4, r2, #0
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	str r0, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	adds r0, #1
	mov sb, r0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0804A2E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A2CA
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
_0804A2CA:
	cmp r4, #0
	beq _0804A2E8
	ldr r0, _0804A2E4 @ =0x08B9A8A0
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #0
	b _0804A2FC
	.align 2, 0
_0804A2E0: .4byte 0x0202BBF8
_0804A2E4: .4byte 0x08B9A8A0
_0804A2E8:
	bl LockGame
	ldr r0, _0804A418 @ =0x08B9A8A0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #1
_0804A2FC:
	strb r0, [r1]
	mov r1, sl
	asrs r0, r1, #0x18
	str r0, [sp, #8]
	cmp r0, #0
	bge _0804A314
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0804A314:
	movs r7, #0
	movs r3, #0
	str r3, [sp]
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0xc]
	mov r2, sl
	lsls r2, r2, #0x10
	str r2, [sp, #0x18]
	adds r3, r5, #0
	adds r3, #0x60
	str r3, [sp, #0xc]
	adds r2, r5, #0
	adds r2, #0x61
	str r2, [sp, #0x10]
	adds r3, #2
	str r3, [sp, #0x14]
	cmp r0, #0
	beq _0804A3CA
	movs r6, #0
_0804A33C:
	adds r0, r1, r6
	adds r1, r7, #0
	bl OverriddenMenuAvailability
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0804A35E
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r6, r0
	ldr r2, [r0, #0xc]
	adds r1, r7, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804A35E:
	cmp r4, #3
	beq _0804A3BA
	ldr r0, _0804A41C @ =0x08B9A8E0
	adds r1, r5, #0
	bl SpawnProc
	adds r2, r0, #0
	ldr r3, [sp]
	lsls r1, r3, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
	adds r3, #1
	str r3, [sp]
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r2, #0x30]
	adds r0, r2, #0
	adds r0, #0x3c
	strb r7, [r0]
	adds r0, #1
	strb r4, [r0]
	mov r3, sp
	ldrh r3, [r3, #4]
	strh r3, [r2, #0x2a]
	mov r0, sb
	strh r0, [r2, #0x2c]
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804A3B6
	adds r0, r2, #0
	adds r0, #0x34
	mov r2, sl
	lsls r1, r2, #8
	asrs r1, r1, #0x18
	subs r1, #2
	bl InitText
_0804A3B6:
	movs r3, #2
	add sb, r3
_0804A3BA:
	adds r6, #0x24
	adds r7, #1
	mov r0, r8
	ldr r1, [r0, #8]
	adds r0, r6, r1
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0804A33C
_0804A3CA:
	mov r1, r8
	str r1, [r5, #0x30]
	mov r2, sl
	str r2, [r5, #0x2c]
	movs r2, #0
	mov r3, sp
	ldrb r0, [r3]
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r1, [sp, #0x10]
	strb r2, [r1]
	movs r0, #0xff
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	ldr r0, [sp, #0x18]
	asrs r1, r0, #0x18
	ldr r3, [sp, #8]
	adds r0, r1, r3
	cmp r0, sb
	bge _0804A3FE
	subs r0, r1, #1
	mov r1, sb
	subs r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_0804A3FE:
	ldr r0, _0804A420 @ =0x08B857F8
	ldr r0, [r0]
	strh r2, [r0, #8]
	adds r0, r5, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804A418: .4byte 0x08B9A8A0
_0804A41C: .4byte 0x08B9A8E0
_0804A420: .4byte 0x08B857F8

	thumb_func_start EndMenu
EndMenu: @ 0x0804A424
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r5, r4, #0
	adds r5, #0x63
	movs r0, #4
	ldrb r2, [r5]
	orrs r0, r2
	strb r0, [r5]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804A450
	adds r0, r4, #0
	bl _call_via_r2
_0804A450:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _0804A45E
	adds r0, r4, #0
	bl _call_via_r1
_0804A45E:
	movs r0, #1
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _0804A46C
	bl ReleaseGame
_0804A46C:
	adds r0, r4, #0
	bl Proc_End
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r4, #0x14]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EndAllMenus
EndAllMenus: @ 0x0804A490
	push {lr}
	ldr r0, _0804A4A0 @ =0x08B9A8A0
	ldr r1, _0804A4A4 @ =EndMenu
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_0804A4A0: .4byte 0x08B9A8A0
_0804A4A4: .4byte EndMenu

	thumb_func_start Menu_OnInit
Menu_OnInit: @ 0x0804A4A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _0804A4BA
	adds r0, r4, #0
	bl _call_via_r1
_0804A4BA:
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804A4D8
	adds r0, r4, #0
	bl _call_via_r2
_0804A4D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804A4E0
sub_0804A4E0: @ 0x0804A4E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804A5CE
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r6, #0
	adds r2, #0x2e
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x2f
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldr r4, [r6, #0x30]
	ldrb r4, [r4, #4]
	str r4, [sp]
	bl DrawUiFrame2
	movs r7, #0
	adds r0, r6, #0
	adds r0, #0x60
	mov r8, r0
	movs r0, #0x61
	adds r0, r0, r6
	mov sb, r0
	mov r1, r8
	ldrb r1, [r1]
	cmp r7, r1
	bge _0804A5BC
_0804A542:
	lsls r1, r7, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r1, [r5, #0x30]
	ldr r2, [r1, #0x10]
	cmp r2, #0
	beq _0804A55E
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r2
	b _0804A5B2
_0804A55E:
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0804A56E
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r1, #8]
	bl Text_SetColor
_0804A56E:
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804A582
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #1
	bl Text_SetColor
_0804A582:
	ldr r1, [r5, #0x30]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _0804A5B2
	adds r4, r5, #0
	adds r4, #0x34
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0804A5DC @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
_0804A5B2:
	adds r7, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804A542
_0804A5BC:
	mov r2, sb
	ldrb r1, [r2]
	adds r0, r6, #0
	movs r2, #1
	bl sub_0804A5E0
	movs r0, #3
	bl EnableBgSync
_0804A5CE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A5DC: .4byte 0x02022C60

	thumb_func_start sub_0804A5E0
sub_0804A5E0: @ 0x0804A5E0
	push {r4, lr}
	mov ip, r0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	mov r3, ip
	adds r3, #0x63
	movs r0, #0x10
	ldrb r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _0804A636
	mov r0, ip
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r0, #1
	lsls r1, r1, #2
	mov r0, ip
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0x2c
	ldrsh r1, [r0, r2]
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, #2
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804A630
	cmp r0, #1
	bne _0804A636
	adds r0, r3, #0
	bl DrawUiItemHover
	b _0804A636
_0804A630:
	adds r0, r3, #0
	bl ClearUiItemHover
_0804A636:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804A63C
sub_0804A63C: @ 0x0804A63C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804A662
	add r2, sp, #4
	adds r0, r5, #0
	mov r1, sp
	bl sub_0804A8B0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	b _0804A726
_0804A662:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804A672
	adds r0, r5, #0
	bl EndMenu
	b _0804A726
_0804A672:
	adds r0, r5, #0
	bl sub_0804A73C
	adds r0, r5, #0
	bl sub_0804A820
	adds r4, r0, #0
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0804A68E
	adds r0, r5, #0
	bl EndMenu
_0804A68E:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0804A6A8
	ldr r0, _0804A730 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A6A8
	ldr r0, _0804A734 @ =0x0000038A
	bl m4aSongNumStart
_0804A6A8:
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0804A6C2
	ldr r0, _0804A730 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A6C2
	ldr r0, _0804A738 @ =0x0000038B
	bl m4aSongNumStart
_0804A6C2:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0804A6CE
	bl ClearUi
_0804A6CE:
	movs r6, #0x20
	adds r0, r4, #0
	ands r0, r6
	cmp r0, #0
	beq _0804A6DE
	movs r0, #0
	bl EndFaceById
_0804A6DE:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0804A6F2
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #0x80
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0804A6F2:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	bne _0804A726
	adds r1, r5, #0
	adds r1, #0x63
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804A726
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804A8B0
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804AB58
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl PutUiHand
_0804A726:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A730: .4byte 0x0202BBF8
_0804A734: .4byte 0x0000038A
_0804A738: .4byte 0x0000038B

	thumb_func_start sub_0804A73C
sub_0804A73C: @ 0x0804A73C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x61
	ldrb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x62
	strb r0, [r1]
	ldr r1, _0804A814 @ =0x08B857F8
	ldr r3, [r1]
	ldrh r4, [r3, #6]
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0804A774
	ldrb r0, [r2]
	cmp r0, #0
	bne _0804A76E
	ldrh r3, [r3, #8]
	cmp r4, r3
	bne _0804A80C
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	strb r0, [r2]
_0804A76E:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_0804A774:
	ldr r1, [r1]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	ands r0, r3
	adds r4, r6, #0
	adds r4, #0x61
	cmp r0, #0
	beq _0804A7A2
	ldrb r2, [r4]
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _0804A79C
	ldrh r1, [r1, #8]
	cmp r3, r1
	bne _0804A80C
	movs r0, #0xff
	strb r0, [r4]
_0804A79C:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0804A7A2:
	adds r0, r6, #0
	adds r0, #0x62
	adds r5, r0, #0
	ldrb r0, [r5]
	ldrb r1, [r4]
	cmp r0, r1
	beq _0804A7D6
	ldrb r1, [r5]
	adds r0, r6, #0
	movs r2, #0
	bl sub_0804A5E0
	ldrb r1, [r4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_0804A5E0
	ldr r0, _0804A818 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A7D6
	ldr r0, _0804A81C @ =0x00000386
	bl m4aSongNumStart
_0804A7D6:
	ldrb r0, [r4]
	ldrb r1, [r5]
	cmp r0, r1
	beq _0804A80C
	lsls r0, r1, #2
	adds r5, r6, #0
	adds r5, #0x34
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804A7F6
	adds r0, r6, #0
	bl _call_via_r2
_0804A7F6:
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804A80C
	adds r0, r6, #0
	bl _call_via_r2
_0804A80C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A814: .4byte 0x08B857F8
_0804A818: .4byte 0x0202BBF8
_0804A81C: .4byte 0x00000386

	thumb_func_start sub_0804A820
sub_0804A820: @ 0x0804A820
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r7, [r5, #0x30]
	ldr r2, [r7, #0x18]
	cmp r2, #0
	beq _0804A848
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0804A848:
	ldr r0, _0804A86C @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A870
	adds r0, r4, #0
	adds r1, r5, #0
	bl OverriddenMenuSelected
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	bne _0804A8A6
	ldr r2, [r7, #0x14]
	b _0804A87C
	.align 2, 0
_0804A86C: .4byte 0x08B857F8
_0804A870:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A88E
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #0x18]
_0804A87C:
	cmp r2, #0
	beq _0804A8A6
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0804A8A6
_0804A88E:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A8A6
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _0804A8A6
	adds r0, r4, #0
	bl _call_via_r1
_0804A8A6:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0804A8B0
sub_0804A8B0: @ 0x0804A8B0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x61
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r1, r3, #0
	adds r1, #0x34
	adds r0, r1, r0
	ldr r0, [r0]
	movs r5, #0x2a
	ldrsh r0, [r0, r5]
	lsls r0, r0, #3
	subs r0, #4
	str r0, [r4]
	mov r6, ip
	ldrb r6, [r6]
	lsls r0, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0x2c
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	str r0, [r2]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0804A8F2
	ldr r0, [r4]
	subs r0, #4
	str r0, [r4]
_0804A8F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0804A8F8
sub_0804A8F8: @ 0x0804A8F8
	movs r0, #1
	bx lr

	thumb_func_start sub_0804A8FC
sub_0804A8FC: @ 0x0804A8FC
	movs r0, #2
	bx lr

	thumb_func_start MenuAlwaysNotShown
MenuAlwaysNotShown: @ 0x0804A900
	movs r0, #3
	bx lr

	thumb_func_start MenuCancelSelect
MenuCancelSelect: @ 0x0804A904
	movs r0, #0x1b
	bx lr

	thumb_func_start MenuStdHelpBox
MenuStdHelpBox: @ 0x0804A908
	push {lr}
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r3, [r1, r2]
	lsls r3, r3, #3
	ldr r1, [r1, #0x30]
	ldrh r2, [r1, #6]
	adds r1, r3, #0
	bl StartHelpBox
	pop {r1}
	bx r1

	thumb_func_start sub_0804A924
sub_0804A924: @ 0x0804A924
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r2, [r4, #0x30]
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r2, #0x20]
	adds r0, r4, #0
	bl _call_via_r2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804A954
sub_0804A954: @ 0x0804A954
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl sub_0804A73C
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804A8B0
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804AB58
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl PutUiHand
	ldr r0, _0804A99C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804A9A4
	bl CloseHelpBox
	ldr r1, _0804A9A0 @ =0x08B9A888
	adds r0, r5, #0
	bl Proc_GotoScript
	b _0804A9CA
	.align 2, 0
_0804A99C: .4byte 0x08B857F8
_0804A9A0: .4byte 0x08B9A888
_0804A9A4:
	adds r1, r5, #0
	adds r1, #0x61
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r2, [r1]
	ldrb r0, [r0]
	cmp r2, r0
	beq _0804A9CA
	ldr r2, [r5, #0x30]
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r2, #0x20]
	adds r0, r5, #0
	bl _call_via_r2
_0804A9CA:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804A9D4
sub_0804A9D4: @ 0x0804A9D4
	push {lr}
	ldr r1, _0804A9E0 @ =0x08B9A8E8
	bl Proc_GotoScript
	pop {r1}
	bx r1
	.align 2, 0
_0804A9E0: .4byte 0x08B9A8E8

	thumb_func_start sub_0804A9E4
sub_0804A9E4: @ 0x0804A9E4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r4, sp, #4
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804A8B0
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804AB58
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	ldr r0, _0804AA2C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804AA22
	bl CloseHelpBox
	ldr r1, _0804AA30 @ =0x08B9A888
	adds r0, r5, #0
	bl Proc_GotoScript
_0804AA22:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AA2C: .4byte 0x08B857F8
_0804AA30: .4byte 0x08B9A888

	thumb_func_start MenuFrozenHelpBox
MenuFrozenHelpBox: @ 0x0804AA34
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _0804AA64 @ =0x08B9A900
	bl Proc_GotoScript
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804AA64: .4byte 0x08B9A900

	thumb_func_start sub_0804AA68
sub_0804AA68: @ 0x0804AA68
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r4, sp, #4
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804A8B0
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804AB58
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	ldr r0, _0804AAA8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804AAA0
	ldr r1, _0804AAAC @ =0x08B9A888
	adds r0, r5, #0
	bl Proc_GotoScript
_0804AAA0:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AAA8: .4byte 0x08B857F8
_0804AAAC: .4byte 0x08B9A888

	thumb_func_start sub_0804AAB0
sub_0804AAB0: @ 0x0804AAB0
	push {lr}
	ldr r1, _0804AABC @ =0x08B9A910
	bl Proc_GotoScript
	pop {r1}
	bx r1
	.align 2, 0
_0804AABC: .4byte 0x08B9A910

	thumb_func_start sub_0804AAC0
sub_0804AAC0: @ 0x0804AAC0
	push {lr}
	ldr r0, _0804AADC @ =0x08B9A8A0
	bl Proc_Find
	cmp r0, #0
	beq _0804AAD6
	adds r0, #0x63
	movs r1, #0x40
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0804AAD6:
	pop {r0}
	bx r0
	.align 2, 0
_0804AADC: .4byte 0x08B9A8A0

	thumb_func_start sub_0804AAE0
sub_0804AAE0: @ 0x0804AAE0
	push {lr}
	ldr r0, _0804AAFC @ =0x08B9A8A0
	bl Proc_Find
	cmp r0, #0
	beq _0804AAF8
	adds r1, r0, #0
	adds r1, #0x63
	movs r0, #0xbf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0804AAF8:
	pop {r0}
	bx r0
	.align 2, 0
_0804AAFC: .4byte 0x08B9A8A0

	thumb_func_start StartSemiCenteredOrphanMenu
StartSemiCenteredOrphanMenu: @ 0x0804AB00
	push {r4, r5, r6, r7, lr}
	bl StartAdjustedMenu
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #6
	bls _0804AB4A
	adds r2, r4, #0
	adds r2, #0x2d
	ldr r5, _0804AB54 @ =0x08B9A920
	ldrb r3, [r1]
	adds r0, r3, r5
	ldrb r7, [r2]
	ldrb r0, [r0]
	subs r0, r7, r0
	strb r0, [r2]
	movs r3, #0
	ldrb r0, [r1]
	cmp r3, r0
	bge _0804AB4A
	adds r6, r5, #0
	adds r2, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
_0804AB34:
	ldm r5!, {r0}
	ldrb r7, [r2]
	adds r1, r7, r6
	ldrh r7, [r0, #0x2c]
	ldrb r1, [r1]
	subs r1, r7, r1
	strh r1, [r0, #0x2c]
	adds r3, #1
	ldrb r0, [r2]
	cmp r3, r0
	blt _0804AB34
_0804AB4A:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804AB54: .4byte 0x08B9A920

	thumb_func_start sub_0804AB58
sub_0804AB58: @ 0x0804AB58
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r6, r2, #0
	adds r0, #0x60
	ldrb r2, [r0]
	cmp r2, #9
	bls _0804AB96
	lsls r0, r2, #4
	subs r0, #0x90
	adds r1, #0x61
	ldrb r1, [r1]
	muls r0, r1, r0
	movs r1, #9
	bl __divsi3
	adds r5, r0, #0
	lsls r4, r5, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	ldr r0, [r6]
	subs r0, r0, r5
	str r0, [r6]
_0804AB96:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ClearMenuOverrides
ClearMenuOverrides: @ 0x0804AB9C
	ldr r1, _0804ABB0 @ =0x03001458
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x78
_0804ABA4:
	strh r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0804ABA4
	bx lr
	.align 2, 0
_0804ABB0: .4byte 0x03001458

	thumb_func_start GetForceDisabledMenuItems
GetForceDisabledMenuItems: @ 0x0804ABB4
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r1, r0, #0
	ldr r2, _0804ABD4 @ =0x03001458
	ldr r5, _0804ABD8 @ =MenuAlwaysNotShown
	adds r3, r2, #4
_0804ABC0:
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _0804ABDC
	ldr r0, [r3]
	cmp r0, r5
	bne _0804ABDC
	ldrh r0, [r2]
	b _0804ABDE
	.align 2, 0
_0804ABD4: .4byte 0x03001458
_0804ABD8: .4byte MenuAlwaysNotShown
_0804ABDC:
	movs r0, #0
_0804ABDE:
	strb r0, [r1]
	adds r1, #1
	adds r2, #8
	adds r3, #8
	adds r4, #1
	cmp r4, #0xf
	ble _0804ABC0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetForceDisabledMenuItems
SetForceDisabledMenuItems: @ 0x0804ABF4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0804ABFA:
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804AC0A
	movs r1, #1
	ldr r2, _0804AC18 @ =MenuAlwaysNotShown
	bl SetMenuOverride
_0804AC0A:
	adds r4, #1
	cmp r4, #0xf
	ble _0804ABFA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AC18: .4byte MenuAlwaysNotShown

	thumb_func_start SetMenuOverride
SetMenuOverride: @ 0x0804AC1C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0804AC24 @ =0x03001458
	b _0804AC2A
	.align 2, 0
_0804AC24: .4byte 0x03001458
_0804AC28:
	adds r3, #8
_0804AC2A:
	movs r5, #2
	ldrsh r0, [r3, r5]
	cmp r0, #0
	beq _0804AC3E
	cmp r0, r1
	bne _0804AC28
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, r4
	bne _0804AC28
_0804AC3E:
	strh r4, [r3]
	strh r1, [r3, #2]
	str r2, [r3, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OverriddenMenuAvailability
OverriddenMenuAvailability: @ 0x0804AC4C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0804AC54 @ =0x03001458
	b _0804AC76
	.align 2, 0
_0804AC54: .4byte 0x03001458
_0804AC58:
	cmp r3, #1
	bne _0804AC74
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldrb r5, [r4, #9]
	cmp r0, r5
	bne _0804AC74
	ldr r2, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0804AC82
_0804AC74:
	adds r2, #8
_0804AC76:
	ldrh r3, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0804AC58
	movs r0, #0
_0804AC82:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start OverriddenMenuSelected
OverriddenMenuSelected: @ 0x0804AC88
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r2, _0804AC94 @ =0x03001458
	b _0804ACBA
	.align 2, 0
_0804AC94: .4byte 0x03001458
_0804AC98:
	cmp r1, #2
	bne _0804ACB8
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bne _0804ACB8
	ldr r2, [r2, #4]
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0804ACC6
_0804ACB8:
	adds r2, #8
_0804ACBA:
	ldrh r1, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0804AC98
	movs r0, #0xff
_0804ACC6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0804ACCC
sub_0804ACCC: @ 0x0804ACCC
	adds r1, r0, #0
	adds r1, #0x61
	adds r0, #0x62
	ldrb r0, [r0]
	ldrb r1, [r1]
	eors r0, r1
	adds r1, r0, #0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0

	thumb_func_start BeginTargetList
BeginTargetList: @ 0x0804ACE4
	ldr r2, _0804ACF4 @ =0x0203DCF4
	movs r3, #0
	strh r0, [r2]
	strh r1, [r2, #2]
	ldr r0, _0804ACF8 @ =0x0203DFF8
	str r3, [r0]
	bx lr
	.align 2, 0
_0804ACF4: .4byte 0x0203DCF4
_0804ACF8: .4byte 0x0203DFF8

	thumb_func_start EnlistTarget
EnlistTarget: @ 0x0804ACFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _0804AD48 @ =0x0203DCF8
	mov r8, r4
	ldr r6, _0804AD4C @ =0x0203DFF8
	ldr r5, [r6]
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	add r4, r8
	strb r0, [r4]
	ldr r4, [r6]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	add r0, r8
	strb r1, [r0, #1]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r2, [r0, #2]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r3, [r0, #3]
	ldr r0, [r6]
	adds r0, #1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AD48: .4byte 0x0203DCF8
_0804AD4C: .4byte 0x0203DFF8

	thumb_func_start LinkTargets
LinkTargets: @ 0x0804AD50
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r0, _0804AD90 @ =0x0203DFF8
	ldr r1, [r0]
	adds r6, r0, #0
	ldr r4, _0804AD94 @ =0x0203DCF8
	cmp r2, r1
	bge _0804AD7A
	adds r5, r6, #0
	adds r3, r4, #0
	adds r3, #0xc
	adds r1, r4, #0
	subs r1, #0xc
_0804AD6A:
	str r1, [r1, #0x14]
	str r3, [r1, #0x10]
	adds r3, #0xc
	adds r1, #0xc
	adds r2, #1
	ldr r0, [r5]
	cmp r2, r0
	blt _0804AD6A
_0804AD7A:
	ldr r1, [r6]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r4, #8]
	str r4, [r0, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AD90: .4byte 0x0203DFF8
_0804AD94: .4byte 0x0203DCF8

	thumb_func_start TargetSelection_GetRealCursorPosition
TargetSelection_GetRealCursorPosition: @ 0x0804AD98
	ldr r3, [r0, #0x30]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	str r0, [r1]
	movs r0, #1
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	str r0, [r2]
	bx lr

	thumb_func_start sub_0804ADAC
sub_0804ADAC: @ 0x0804ADAC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804ADD6
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl TargetSelection_GetRealCursorPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #4
	bl PutMapCursor
	b _0804AE72
_0804ADD6:
	adds r0, r4, #0
	bl sub_0804AF34
	adds r0, r4, #0
	bl TargetSelection_HandleSelectInput
	adds r5, r0, #0
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0804ADF2
	adds r0, r4, #0
	bl EndTargetSelection
_0804ADF2:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0804AE0C
	ldr r0, _0804AE7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AE0C
	ldr r0, _0804AE80 @ =0x0000038A
	bl m4aSongNumStart
_0804AE0C:
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0804AE26
	ldr r0, _0804AE7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AE26
	ldr r0, _0804AE84 @ =0x0000038B
	bl m4aSongNumStart
_0804AE26:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0804AE32
	bl ClearUi
_0804AE32:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0804AE40
	movs r0, #0
	bl EndFaceById
_0804AE40:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _0804AE72
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl TargetSelection_GetRealCursorPosition
	ldr r1, [sp]
	asrs r1, r1, #4
	ldr r2, [sp, #4]
	asrs r2, r2, #4
	adds r0, r4, #0
	bl CameraMoveWatchPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804AE72
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #2
	bl PutMapCursor
_0804AE72:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AE7C: .4byte 0x0202BBF8
_0804AE80: .4byte 0x0000038A
_0804AE84: .4byte 0x0000038B

	thumb_func_start StartMapSelect
StartMapSelect: @ 0x0804AE88
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl LockGame
	ldr r0, _0804AEE8 @ =0x08B9A92C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x34
	movs r6, #0
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x2c]
	bl GetLinkedTargets
	str r0, [r5, #0x30]
	str r6, [r5, #0x38]
	ldr r0, [r5, #0x2c]
	ldr r1, [r0]
	cmp r1, #0
	beq _0804AEBC
	adds r0, r5, #0
	bl _call_via_r1
_0804AEBC:
	ldr r0, [r5, #0x2c]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0804AECA
	adds r0, r5, #0
	bl _call_via_r1
_0804AECA:
	ldr r0, [r5, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _0804AEDA
	ldr r1, [r5, #0x30]
	adds r0, r5, #0
	bl _call_via_r2
_0804AEDA:
	ldr r0, _0804AEEC @ =0x08B857F8
	ldr r0, [r0]
	strh r6, [r0, #8]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804AEE8: .4byte 0x08B9A92C
_0804AEEC: .4byte 0x08B857F8

	thumb_func_start NewTargetSelection_Specialized
NewTargetSelection_Specialized: @ 0x0804AEF0
	push {r4, lr}
	adds r4, r1, #0
	bl StartMapSelect
	str r4, [r0, #0x38]
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EndTargetSelection
EndTargetSelection: @ 0x0804AF00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0804AF12
	adds r0, r4, #0
	bl _call_via_r1
_0804AF12:
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804AF24
	bl ReleaseGame
_0804AF24:
	adds r0, r4, #0
	bl Proc_End
	ldr r0, [r4, #0x14]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0804AF34
sub_0804AF34: @ 0x0804AF34
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	ldr r2, _0804AFA4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x60
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0804AF50
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _0804AF50
	str r0, [r4, #0x30]
_0804AF50:
	ldr r1, [r2]
	movs r0, #0x90
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0804AF66
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0804AF66
	str r0, [r4, #0x30]
_0804AF66:
	ldr r0, [r4, #0x30]
	cmp r0, r3
	beq _0804AF9E
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _0804AF7C
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
_0804AF7C:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _0804AF8C
	ldr r1, [r4, #0x30]
	adds r0, r4, #0
	bl _call_via_r2
_0804AF8C:
	ldr r0, _0804AFA8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AF9E
	ldr r0, _0804AFAC @ =0x00000387
	bl m4aSongNumStart
_0804AF9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804AFA4: .4byte 0x08B857F8
_0804AFA8: .4byte 0x0202BBF8
_0804AFAC: .4byte 0x00000387

	thumb_func_start TargetSelection_HandleSelectInput
TargetSelection_HandleSelectInput: @ 0x0804AFB0
	push {r4, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _0804AFD0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804AFD4
	ldr r3, [r2, #0x38]
	cmp r3, #0
	bne _0804AFF4
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x14]
	b _0804AFF0
	.align 2, 0
_0804AFD0: .4byte 0x08B857F8
_0804AFD4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804AFE2
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x18]
	b _0804AFF0
_0804AFE2:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804B000
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x1c]
_0804AFF0:
	cmp r3, #0
	beq _0804B000
_0804AFF4:
	ldr r1, [r2, #0x30]
	adds r0, r2, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804B000:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0804B008
sub_0804B008: @ 0x0804B008
	push {lr}
	ldr r0, _0804B024 @ =0x08B9A92C
	bl Proc_Find
	cmp r0, #0
	beq _0804B01E
	adds r0, #0x34
	movs r1, #0x40
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0804B01E:
	pop {r0}
	bx r0
	.align 2, 0
_0804B024: .4byte 0x08B9A92C

	thumb_func_start sub_0804B028
sub_0804B028: @ 0x0804B028
	push {lr}
	ldr r0, _0804B044 @ =0x08B9A92C
	bl Proc_Find
	cmp r0, #0
	beq _0804B040
	adds r1, r0, #0
	adds r1, #0x34
	movs r0, #0xbf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0804B040:
	pop {r0}
	bx r0
	.align 2, 0
_0804B044: .4byte 0x08B9A92C

	thumb_func_start GetFurthestTargetDistance
GetFurthestTargetDistance: @ 0x0804B048
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _0804B080 @ =0x0203DCF8
	ldr r0, _0804B084 @ =0x0203DFF8
	ldr r0, [r0]
	cmp r7, r0
	bge _0804B09E
	ldr r1, _0804B088 @ =0x0203DCF4
	mov ip, r1
	movs r2, #0
	ldrsh r6, [r1, r2]
	adds r4, r0, #0
_0804B060:
	movs r0, #0
	ldrsb r0, [r5, r0]
	subs r2, r6, r0
	cmp r2, #0
	bge _0804B06C
	subs r2, r0, r6
_0804B06C:
	mov r0, ip
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r0, #1
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	blt _0804B08C
	adds r0, r2, r1
	b _0804B090
	.align 2, 0
_0804B080: .4byte 0x0203DCF8
_0804B084: .4byte 0x0203DFF8
_0804B088: .4byte 0x0203DCF4
_0804B08C:
	subs r0, r0, r3
	adds r0, r2, r0
_0804B090:
	cmp r7, r0
	bge _0804B096
	adds r7, r0, #0
_0804B096:
	subs r4, #1
	adds r5, #0xc
	cmp r4, #0
	bne _0804B060
_0804B09E:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetLinkedTargetsNear
GetLinkedTargetsNear: @ 0x0804B0A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	movs r5, #0
	movs r4, #0
	ldr r0, _0804B13C @ =0x0203DFF8
	mov sb, r0
	ldr r1, _0804B140 @ =0x0203DCF4
	mov r8, r1
	ldr r3, _0804B144 @ =0x08B9A964
	mov sl, r3
_0804B0C6:
	mov r6, r8
	movs r0, #0
	ldrsh r2, [r6, r0]
	lsls r1, r4, #2
	add r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	str r2, [sp]
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #1
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	movs r1, #0
	ldr r3, _0804B148 @ =0x0203DCF8
	mov r6, sb
	ldr r0, [r6]
	adds r4, #1
	cmp r1, r0
	bge _0804B120
	mov ip, sb
_0804B0F2:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r6, [sp]
	cmp r6, r0
	bne _0804B114
	movs r0, #1
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _0804B114
	str r5, [r3, #4]
	cmp r5, #0
	beq _0804B10C
	str r3, [r5, #8]
_0804B10C:
	cmp r7, #0
	bne _0804B112
	adds r7, r3, #0
_0804B112:
	adds r5, r3, #0
_0804B114:
	adds r1, #1
	adds r3, #0xc
	mov r6, ip
	ldr r0, [r6]
	cmp r1, r0
	blt _0804B0F2
_0804B120:
	cmp r4, #0xc
	ble _0804B0C6
	str r5, [r7, #4]
	str r7, [r5, #8]
	adds r0, r7, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804B13C: .4byte 0x0203DFF8
_0804B140: .4byte 0x0203DCF4
_0804B144: .4byte 0x08B9A964
_0804B148: .4byte 0x0203DCF8

	thumb_func_start GetLinkedTargetsFar
GetLinkedTargetsFar: @ 0x0804B14C
	push {lr}
	bl LinkTargets
	ldr r0, _0804B158 @ =0x0203DCF8
	pop {r1}
	bx r1
	.align 2, 0
_0804B158: .4byte 0x0203DCF8

	thumb_func_start GetLinkedTargets
GetLinkedTargets: @ 0x0804B15C
	push {lr}
	bl GetFurthestTargetDistance
	cmp r0, #2
	bgt _0804B16C
	bl GetLinkedTargetsNear
	b _0804B170
_0804B16C:
	bl GetLinkedTargetsFar
_0804B170:
	pop {r1}
	bx r1

	thumb_func_start CountTargets
CountTargets: @ 0x0804B174
	ldr r0, _0804B17C @ =0x0203DFF8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0804B17C: .4byte 0x0203DFF8

	thumb_func_start GetTarget
GetTarget: @ 0x0804B180
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0804B190 @ =0x0203DCF8
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0804B190: .4byte 0x0203DCF8

	thumb_func_start SetBanimLinkArenaFlag
SetBanimLinkArenaFlag: @ 0x0804B194
	ldr r1, _0804B19C @ =0x0203DFFC
	str r0, [r1]
	bx lr
	.align 2, 0
_0804B19C: .4byte 0x0203DFFC

	thumb_func_start GetBanimLinkArenaFlag
GetBanimLinkArenaFlag: @ 0x0804B1A0
	ldr r0, _0804B1A8 @ =0x0203DFFC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0804B1A8: .4byte 0x0203DFFC

	thumb_func_start NewEkrBattleDeamon
NewEkrBattleDeamon: @ 0x0804B1AC
	push {r4, lr}
	ldr r4, _0804B1CC @ =0x0203E004
	ldr r0, _0804B1D0 @ =0x08B9A99C
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	ldr r1, _0804B1D4 @ =0x0203E000
	movs r0, #1
	str r0, [r1]
	bl LockGame
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B1CC: .4byte 0x0203E004
_0804B1D0: .4byte 0x08B9A99C
_0804B1D4: .4byte 0x0203E000

	thumb_func_start sub_0804B1D8
sub_0804B1D8: @ 0x0804B1D8
	push {lr}
	ldr r0, _0804B1E8 @ =0x0203E004
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804B1E8: .4byte 0x0203E004

	thumb_func_start IsBattleDeamonActive
IsBattleDeamonActive: @ 0x0804B1EC
	ldr r0, _0804B1F8 @ =0x0203E000
	ldr r0, [r0]
	cmp r0, #1
	beq _0804B1FC
	movs r0, #0
	b _0804B1FE
	.align 2, 0
_0804B1F8: .4byte 0x0203E000
_0804B1FC:
	movs r0, #1
_0804B1FE:
	bx lr

	thumb_func_start EkrBattleDeamon_OnEnd
EkrBattleDeamon_OnEnd: @ 0x0804B200
	push {lr}
	ldr r1, _0804B210 @ =0x0203E000
	movs r0, #0
	str r0, [r1]
	bl ReleaseGame
	pop {r0}
	bx r0
	.align 2, 0
_0804B210: .4byte 0x0203E000

	thumb_func_start sub_0804B214
sub_0804B214: @ 0x0804B214
	bx lr
	.align 2, 0

	thumb_func_start NewEkrBattle
NewEkrBattle: @ 0x0804B218
	push {r4, lr}
	bl AnimClearAll
	ldr r4, _0804B260 @ =0x02000064
	ldr r0, _0804B264 @ =0x08B9A9BC
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	ldr r0, _0804B268 @ =InBattleMainRoutine
	bl SetMainFunc
	bl EkrEfxStatusClear
	ldr r0, _0804B26C @ =0x02017724
	movs r1, #0
	str r1, [r0]
	ldr r0, _0804B270 @ =0x02000018
	str r1, [r0]
	ldr r0, _0804B274 @ =0x0200001C
	str r1, [r0]
	ldr r0, _0804B278 @ =0x02000020
	str r1, [r0]
	ldr r0, _0804B27C @ =0x02000024
	str r1, [r0]
	ldr r0, _0804B280 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B258
	bl EkrPlayMainBGM
_0804B258:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B260: .4byte 0x02000064
_0804B264: .4byte 0x08B9A9BC
_0804B268: .4byte InBattleMainRoutine
_0804B26C: .4byte 0x02017724
_0804B270: .4byte 0x02000018
_0804B274: .4byte 0x0200001C
_0804B278: .4byte 0x02000020
_0804B27C: .4byte 0x02000024
_0804B280: .4byte 0x0203E008

	thumb_func_start InBattleMainRoutine
InBattleMainRoutine: @ 0x0804B284
	push {lr}
	ldr r0, _0804B29C @ =0x08B857F8
	ldr r0, [r0]
	bl RefreshKeySt
	ldr r0, _0804B2A0 @ =0x0200001C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804B2A4
	bl MainUpdateEkrBattle
	b _0804B2B0
	.align 2, 0
_0804B29C: .4byte 0x08B857F8
_0804B2A0: .4byte 0x0200001C
_0804B2A4:
	ldr r0, _0804B2C4 @ =0x02000020
	ldr r0, [r0]
	cmp r0, #1
	bne _0804B2B0
	bl MainUpdateEkrBattle
_0804B2B0:
	ldr r0, _0804B2C8 @ =0x02017724
	ldr r0, [r0]
	cmp r0, #1
	beq _0804B2CC
	cmp r0, #1
	blo _0804B308
	cmp r0, #2
	beq _0804B2DC
	b _0804B308
	.align 2, 0
_0804B2C4: .4byte 0x02000020
_0804B2C8: .4byte 0x02017724
_0804B2CC:
	ldr r0, _0804B2D8 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B308
	b _0804B2E6
	.align 2, 0
_0804B2D8: .4byte 0x0203E008
_0804B2DC:
	ldr r0, _0804B2F4 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B2FC
_0804B2E6:
	ldr r0, _0804B2F8 @ =0x02000064
	ldr r0, [r0]
	bl Proc_End
	bl EkrBattleEndRountine
	b _0804B308
	.align 2, 0
_0804B2F4: .4byte 0x0203E008
_0804B2F8: .4byte 0x02000064
_0804B2FC:
	ldr r0, _0804B31C @ =0x02000064
	ldr r0, [r0]
	bl Proc_End
	bl EndEkrGauge
_0804B308:
	ldr r1, _0804B320 @ =0x0202BBB8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0804B324 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r0}
	bx r0
	.align 2, 0
_0804B31C: .4byte 0x02000064
_0804B320: .4byte 0x0202BBB8
_0804B324: .4byte 0x04000006

	thumb_func_start MainUpdateEkrBattle
MainUpdateEkrBattle: @ 0x0804B328
	push {r4, lr}
	bl ClearSprites
	bl UnregisterEfxSoundSeExist
	bl GetGameLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B344
	ldr r0, _0804B394 @ =0x02026A30
	ldr r0, [r0, #8]
	bl Proc_Run
_0804B344:
	ldr r4, _0804B394 @ =0x02026A30
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #4]
	bl Proc_Run
	bl AnimUpdateAll
	bl BattleAIS_ExecCommands
	ldr r0, [r4, #0x10]
	bl Proc_Run
	ldr r1, _0804B398 @ =0x02000020
	movs r0, #0
	str r0, [r1]
	ldr r1, _0804B39C @ =0x0201FAF8
	ldr r0, [r1]
	ldr r1, [r1, #4]
	adds r0, r0, r1
	cmp r0, #2
	beq _0804B386
	ldr r1, _0804B3A0 @ =0x02000018
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0804B386:
	movs r0, #0xd
	bl PutSpriteLayerOam
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B394: .4byte 0x02026A30
_0804B398: .4byte 0x02000020
_0804B39C: .4byte 0x0201FAF8
_0804B3A0: .4byte 0x02000018

	thumb_func_start sub_0804B3A4
sub_0804B3A4: @ 0x0804B3A4
	bx lr
	.align 2, 0

	thumb_func_start EkrBattle_Init
EkrBattle_Init: @ 0x0804B3A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804B3C8 @ =0x0201FB00
	movs r0, #0
	str r0, [r1]
	ldr r0, _0804B3CC @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _0804B3DA
	ldr r0, _0804B3D0 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804B3D4
	movs r0, #0x20
	rsbs r0, r0, #0
	b _0804B3D8
	.align 2, 0
_0804B3C8: .4byte 0x0201FB00
_0804B3CC: .4byte 0x02017744
_0804B3D0: .4byte 0x0203E02C
_0804B3D4:
	movs r0, #0xf0
	rsbs r0, r0, #0
_0804B3D8:
	str r0, [r1]
_0804B3DA:
	bl InitMainAnims
	bl InitEkrDragonStatus
	ldr r0, _0804B3F4 @ =0x02000024
	movs r1, #1
	str r1, [r0]
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _0804B3F8
	movs r0, #0
	b _0804B3FA
	.align 2, 0
_0804B3F4: .4byte 0x02000024
_0804B3F8:
	movs r0, #0x1e
_0804B3FA:
	strh r0, [r4, #0x2c]
	ldr r0, _0804B410 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B418
	ldr r1, _0804B414 @ =0x0203E09C
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	b _0804B41E
	.align 2, 0
_0804B410: .4byte 0x0203E00C
_0804B414: .4byte 0x0203E09C
_0804B418:
	ldr r1, _0804B438 @ =0x0203E09C
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
_0804B41E:
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x54]
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B438: .4byte 0x0203E09C

	thumb_func_start EkrBattle_Main
EkrBattle_Main: @ 0x0804B43C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _0804B484
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0804B47C
	ldr r0, [r4, #0x54]
	cmp r0, #1
	beq _0804B462
	ldr r0, [r4, #0x58]
	cmp r0, #1
	bne _0804B47C
_0804B462:
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	ldr r0, _0804B478 @ =EkrBattleStartBattleQuote
	b _0804B47E
	.align 2, 0
_0804B478: .4byte EkrBattleStartBattleQuote
_0804B47C:
	ldr r0, _0804B48C @ =EkrBattlePreDragonIntro
_0804B47E:
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_0804B484:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B48C: .4byte EkrBattlePreDragonIntro

	thumb_func_start EkrBattleStartBattleQuote
EkrBattleStartBattleQuote: @ 0x0804B490
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804B51A
	bl EnableEkrGauge
	bl AsyncEkrDispUP
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804B4F4 @ =0x02022C60
	ldr r2, _0804B4F8 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0804B4FC @ =0x02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_0804CC38
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _0804B516
	ldr r0, _0804B500 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B508
	ldr r1, _0804B504 @ =0x0203E09C
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl StartBattleTalk
	b _0804B512
	.align 2, 0
_0804B4F4: .4byte 0x02022C60
_0804B4F8: .4byte 0x01000200
_0804B4FC: .4byte 0x02000038
_0804B500: .4byte 0x0203E00C
_0804B504: .4byte 0x0203E09C
_0804B508:
	ldr r1, _0804B524 @ =0x0203E09C
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
	bl StartBattleTalk
_0804B512:
	movs r0, #0
	str r0, [r4, #0x54]
_0804B516:
	ldr r0, _0804B528 @ =EkrBattleWaitBattleQuote
	str r0, [r4, #0xc]
_0804B51A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B524: .4byte 0x0203E09C
_0804B528: .4byte EkrBattleWaitBattleQuote

	thumb_func_start EkrBattleWaitBattleQuote
EkrBattleWaitBattleQuote: @ 0x0804B52C
	push {r4, lr}
	adds r4, r0, #0
	bl IsEventRunning
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B566
	bl EfxPrepareScreenFx
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl DisableEkrGauge
	bl UnAsyncEkrDispUP
	bl EkrGauge_0804CC28
	ldr r0, _0804B56C @ =EkrBattleWaitWindowAppear
	str r0, [r4, #0xc]
_0804B566:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B56C: .4byte EkrBattleWaitWindowAppear

	thumb_func_start EkrBattleWaitWindowAppear
EkrBattleWaitWindowAppear: @ 0x0804B570
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804B588
	ldr r0, _0804B590 @ =EkrBattlePreDragonIntro
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_0804B588:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B590: .4byte EkrBattlePreDragonIntro

	thumb_func_start EkrBattlePreDragonIntro
EkrBattlePreDragonIntro: @ 0x0804B594
	ldr r1, _0804B5A8 @ =0x0203E00C
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x44]
	movs r1, #0
	str r1, [r0, #0x48]
	ldr r1, _0804B5AC @ =EkrBattleExecDragonIntro
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804B5A8: .4byte 0x0203E00C
_0804B5AC: .4byte EkrBattleExecDragonIntro

	thumb_func_start EkrBattleExecDragonIntro
EkrBattleExecDragonIntro: @ 0x0804B5B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0804B5C4
	ldr r0, _0804B5C0 @ =EkrBattlePostDragonIntro
	str r0, [r4, #0xc]
	b _0804B612
	.align 2, 0
_0804B5C0: .4byte EkrBattlePostDragonIntro
_0804B5C4:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0804B5F0
	ldr r0, _0804B5E8 @ =0x02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804B5E2
	ldr r0, [r4, #0x5c]
	bl NewEkrDragon
	ldr r0, _0804B5EC @ =EkrBattleWaitDragonIntro
	str r0, [r4, #0xc]
_0804B5E2:
	movs r0, #1
	b _0804B60A
	.align 2, 0
_0804B5E8: .4byte 0x02000000
_0804B5EC: .4byte EkrBattleWaitDragonIntro
_0804B5F0:
	ldr r0, _0804B618 @ =0x02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804B608
	ldr r0, [r4, #0x5c]
	bl NewEkrDragon
	ldr r0, _0804B61C @ =EkrBattleWaitDragonIntro
	str r0, [r4, #0xc]
_0804B608:
	movs r0, #0
_0804B60A:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_0804B612:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B618: .4byte 0x02000000
_0804B61C: .4byte EkrBattleWaitDragonIntro

	thumb_func_start EkrBattleWaitDragonIntro
EkrBattleWaitDragonIntro: @ 0x0804B620
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl EkrDragonIntroDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804B636
	ldr r0, _0804B63C @ =EkrBattleExecDragonIntro
	str r0, [r4, #0xc]
_0804B636:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B63C: .4byte EkrBattleExecDragonIntro

	thumb_func_start EkrBattlePostDragonIntro
EkrBattlePostDragonIntro: @ 0x0804B640
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B66C @ =0x0203E00C
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _0804B670 @ =0x02017744
	ldr r0, [r0]
	cmp r1, r0
	beq _0804B67C
	ldr r1, _0804B674 @ =0x02000000
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0804B678 @ =ekrBattle_8050290
	b _0804B67E
	.align 2, 0
_0804B66C: .4byte 0x0203E00C
_0804B670: .4byte 0x02017744
_0804B674: .4byte 0x02000000
_0804B678: .4byte ekrBattle_8050290
_0804B67C:
	ldr r0, _0804B688 @ =ekrBattleSetFlashingEffect
_0804B67E:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B688: .4byte ekrBattleSetFlashingEffect

	thumb_func_start ekrBattle_8050290
ekrBattle_8050290: @ 0x0804B68C
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0804B6A0
	ldr r0, _0804B6A4 @ =ekrBattleSetFlashingEffect
	str r0, [r1, #0xc]
_0804B6A0:
	bx lr
	.align 2, 0
_0804B6A4: .4byte ekrBattleSetFlashingEffect

	thumb_func_start ekrBattleSetFlashingEffect
ekrBattleSetFlashingEffect: @ 0x0804B6A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804B6EC @ =0x02000000
	ldr r0, [r4]
	bl NewEfxStatusUnit
	ldr r0, [r4, #8]
	bl NewEfxStatusUnit
	ldr r1, _0804B6F0 @ =0x0203E0E4
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl NewEfxWeaponIcon
	ldr r1, _0804B6F4 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0804B6DA
	ldr r0, [r4]
	bl DisableEfxStatusUnits
_0804B6DA:
	ldr r0, [r4]
	bl NewEfxHpBarColorChange
	ldr r0, _0804B6F8 @ =ekrBattleExecTriangleAtk
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B6EC: .4byte 0x02000000
_0804B6F0: .4byte 0x0203E0E4
_0804B6F4: .4byte 0x0203A3D8
_0804B6F8: .4byte ekrBattleExecTriangleAtk

	thumb_func_start ekrBattleExecTriangleAtk
ekrBattleExecTriangleAtk: @ 0x0804B6FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B714 @ =0x0203E0A0
	ldr r0, [r0]
	cmp r0, #0
	beq _0804B720
	ldr r0, _0804B718 @ =0x02000000
	ldr r0, [r0, #8]
	bl NewEkrTriangle
	ldr r0, _0804B71C @ =ekrBattleWaitTriangleIdle
	b _0804B722
	.align 2, 0
_0804B714: .4byte 0x0203E0A0
_0804B718: .4byte 0x02000000
_0804B71C: .4byte ekrBattleWaitTriangleIdle
_0804B720:
	ldr r0, _0804B72C @ =ekrBattleTriggerNewRoundStart
_0804B722:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B72C: .4byte ekrBattleTriggerNewRoundStart

	thumb_func_start ekrBattleWaitTriangleIdle
ekrBattleWaitTriangleIdle: @ 0x0804B730
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrTriangleInvalid
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804B74C
	bl sub_0806A4B8
	movs r0, #0x1e
	strh r0, [r4, #0x2c]
	ldr r0, _0804B754 @ =ekrBattleTriggerNewRoundStart
	str r0, [r4, #0xc]
_0804B74C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B754: .4byte ekrBattleTriggerNewRoundStart

	thumb_func_start ekrBattleTriggerNewRoundStart
ekrBattleTriggerNewRoundStart: @ 0x0804B758
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _0804B7C4
	ldr r6, _0804B7CC @ =0x0203E010
	ldrh r0, [r6]
	cmp r0, #1
	bne _0804B794
	ldr r3, _0804B7D0 @ =0x02000000
	ldr r4, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #4]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r1, r0
	strh r1, [r4, #0xc]
_0804B794:
	ldrh r6, [r6, #2]
	cmp r6, #1
	bne _0804B7BA
	ldr r3, _0804B7D0 @ =0x02000000
	ldr r4, [r3, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #0xc]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r1, r0
	strh r1, [r4, #0xc]
_0804B7BA:
	ldr r0, _0804B7D4 @ =0x0201FAF8
	str r7, [r0]
	str r7, [r0, #4]
	ldr r0, _0804B7D8 @ =ekrBattle_80503EC
	str r0, [r5, #0xc]
_0804B7C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B7CC: .4byte 0x0203E010
_0804B7D0: .4byte 0x02000000
_0804B7D4: .4byte 0x0201FAF8
_0804B7D8: .4byte ekrBattle_80503EC

	thumb_func_start ekrBattle_80503EC
ekrBattle_80503EC: @ 0x0804B7DC
	ldr r2, _0804B7E8 @ =0x02000024
	movs r1, #0
	str r1, [r2]
	ldr r1, _0804B7EC @ =ekrBattle_StartPromotion
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804B7E8: .4byte 0x02000024
_0804B7EC: .4byte ekrBattle_StartPromotion

	thumb_func_start ekrBattle_StartPromotion
ekrBattle_StartPromotion: @ 0x0804B7F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B808 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _0804B814
	ldr r0, _0804B80C @ =0x02000000
	ldr r0, [r0, #8]
	bl NewEkrClassChg
	ldr r0, _0804B810 @ =ekrBattle_WaitPromotionIdle
	b _0804B81E
	.align 2, 0
_0804B808: .4byte 0x0203E02C
_0804B80C: .4byte 0x02000000
_0804B810: .4byte ekrBattle_WaitPromotionIdle
_0804B814:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804B828 @ =sub_0804B858
_0804B81E:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B828: .4byte sub_0804B858

	thumb_func_start ekrBattle_WaitPromotionIdle
ekrBattle_WaitPromotionIdle: @ 0x0804B82C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl EkrClasschgFinished
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0804B848
	bl EndEkrClasschg
	ldr r0, _0804B850 @ =0x0203E0D4
	strh r4, [r0]
	ldr r0, _0804B854 @ =EkrBattleExecEkrLvup
	str r0, [r5, #0xc]
_0804B848:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B850: .4byte 0x0203E0D4
_0804B854: .4byte EkrBattleExecEkrLvup

	thumb_func_start sub_0804B858
sub_0804B858: @ 0x0804B858
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _0804B888 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0804B874
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_0804B874:
	ldr r0, _0804B88C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _0804B930
	cmp r0, #3
	ble _0804B890
	cmp r0, #4
	beq _0804B93C
	b _0804B93E
	.align 2, 0
_0804B888: .4byte 0x08B857F8
_0804B88C: .4byte 0x0203E02C
_0804B890:
	cmp r0, #0
	blt _0804B93E
	ldr r0, _0804B8D8 @ =0x0201FAF8
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #2
	bne _0804B93E
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804B93C
	ldr r5, _0804B8DC @ =0x0203E0D4
	ldr r0, _0804B8E0 @ =0x0203E094
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	ldr r0, _0804B8E4 @ =0x0203E098
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #2]
	ldr r1, _0804B8E8 @ =0x0203E0B8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804B8EC
	movs r0, #1
	bl ArenaSetResult
	b _0804B93C
	.align 2, 0
_0804B8D8: .4byte 0x0201FAF8
_0804B8DC: .4byte 0x0203E0D4
_0804B8E0: .4byte 0x0203E094
_0804B8E4: .4byte 0x0203E098
_0804B8E8: .4byte 0x0203E0B8
_0804B8EC:
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804B8FE
	movs r0, #2
_0804B8F6:
	bl ArenaSetResult
	strh r4, [r5, #2]
	b _0804B93C
_0804B8FE:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804B910
	bl sub_0805555C
	movs r0, #4
	b _0804B8F6
_0804B910:
	bl ArenaContinueBattle
	bl ParseBattleHitToBanimCmd
	bl AnimClearAll
	bl UpdateBanimFrame
	bl InitMainAnims
	strh r4, [r6, #0x2c]
	ldr r0, _0804B92C @ =ekrBattleTriggerNewRoundStart
	str r0, [r6, #0xc]
	b _0804B93E
	.align 2, 0
_0804B92C: .4byte ekrBattleTriggerNewRoundStart
_0804B930:
	ldr r0, _0804B94C @ =0x0201FAF8
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #1
	bne _0804B93E
_0804B93C:
	movs r4, #1
_0804B93E:
	cmp r4, #1
	bne _0804B946
	ldr r0, _0804B950 @ =ekrBattleOnBattleEnd
	str r0, [r6, #0xc]
_0804B946:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B94C: .4byte 0x0201FAF8
_0804B950: .4byte ekrBattleOnBattleEnd

	thumb_func_start ekrBattleOnBattleEnd
ekrBattleOnBattleEnd: @ 0x0804B954
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	ldr r1, _0804B964 @ =ekrBattle_8050600
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0804B964: .4byte ekrBattle_8050600

	thumb_func_start ekrBattle_8050600
ekrBattle_8050600: @ 0x0804B968
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804B9D4 @ =0x02017728
	ldr r0, [r0]
	cmp r0, #0
	bne _0804B9CE
	ldr r0, _0804B9D8 @ =0x02017738
	ldr r4, [r0]
	cmp r4, #0
	bne _0804B9CE
	bl sub_08051BD0
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _0804B9CE
	strh r4, [r5, #0x2c]
	ldr r0, _0804B9DC @ =ekrBattle_WaitForPostBattleAct
	str r0, [r5, #0xc]
	ldr r4, _0804B9E0 @ =0x02000000
	ldr r0, [r4]
	bl CheckEfxDragonDeadFallHead
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B9CE
	ldr r0, _0804B9E4 @ =0x0203E0D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #1
	cmp r0, #0
	beq _0804B9AA
	movs r2, #0
_0804B9AA:
	ldr r3, _0804B9E8 @ =0x02017744
	ldr r0, [r3]
	adds r1, r5, #0
	adds r1, #0x29
	cmp r2, r0
	beq _0804B9B8
	strb r6, [r1]
_0804B9B8:
	ldrb r1, [r1]
	cmp r1, #1
	bne _0804B9CE
	ldr r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0804B9CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B9D4: .4byte 0x02017728
_0804B9D8: .4byte 0x02017738
_0804B9DC: .4byte ekrBattle_WaitForPostBattleAct
_0804B9E0: .4byte 0x02000000
_0804B9E4: .4byte 0x0203E0D4
_0804B9E8: .4byte 0x02017744

	thumb_func_start ekrBattle_WaitForPostBattleAct
ekrBattle_WaitForPostBattleAct: @ 0x0804B9EC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _0804BA24
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0804BA20
	ldr r0, _0804BA18 @ =0x0203E0D4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmn r1, r0
	beq _0804BA20
	ldr r0, _0804BA1C @ =ekrBattleExecExpGain
	b _0804BA22
	.align 2, 0
_0804BA18: .4byte 0x0203E0D4
_0804BA1C: .4byte ekrBattleExecExpGain
_0804BA20:
	ldr r0, _0804BA2C @ =EkrBattleExecPopup
_0804BA22:
	str r0, [r4, #0xc]
_0804BA24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA2C: .4byte EkrBattleExecPopup

	thumb_func_start ekrBattleExecExpGain
ekrBattleExecExpGain: @ 0x0804BA30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r0, _0804BB38 @ =0x02019484
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	mov sl, r0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r7, _0804BB3C @ =0x03002870
	movs r0, #0x20
	ldrb r2, [r7, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	movs r2, #0x94
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r3, #1
	mov r8, r3
	mov r1, r8
	ldr r6, _0804BB40 @ =0x030028A4
	ldrb r6, [r6]
	orrs r1, r6
	movs r0, #2
	mov sb, r0
	mov r2, sb
	orrs r1, r2
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r6, #0x36
	mov r0, r8
	ldrb r2, [r6, r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	subs r2, #0x1e
	ands r1, r2
	ldr r3, _0804BB40 @ =0x030028A4
	strb r1, [r3]
	ands r0, r2
	strb r0, [r6, r7]
	ldr r0, _0804BB44 @ =0x081D97F0
	ldr r1, _0804BB48 @ =0x06002000
	movs r2, #0xc0
	lsls r2, r2, #2
	bl RegisterDataMove
	ldr r0, _0804BB4C @ =0x081D9F50
	ldr r1, _0804BB50 @ =0x020238AC
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x12
	movs r3, #3
	bl EfxTmCpyBG
	ldr r0, _0804BB54 @ =0x081D9FBC
	ldr r1, _0804BB58 @ =0x02022880
	movs r2, #8
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	bl EnablePalSync
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	strb r0, [r7, #0x10]
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	mov r3, r8
	orrs r0, r3
	strb r0, [r7, #0xc]
	ldrb r6, [r7, #0x14]
	ands r1, r6
	mov r0, sb
	orrs r1, r0
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #1
	bl EkrGauge_0804CC68
	ldr r0, _0804BB5C @ =0x0203E0D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0804BB64
	ldr r0, _0804BB60 @ =0x0203E0D0
	movs r3, #0
	ldrsh r0, [r0, r3]
	b _0804BB6A
	.align 2, 0
_0804BB38: .4byte 0x02019484
_0804BB3C: .4byte 0x03002870
_0804BB40: .4byte 0x030028A4
_0804BB44: .4byte 0x081D97F0
_0804BB48: .4byte 0x06002000
_0804BB4C: .4byte 0x081D9F50
_0804BB50: .4byte 0x020238AC
_0804BB54: .4byte 0x081D9FBC
_0804BB58: .4byte 0x02022880
_0804BB5C: .4byte 0x0203E0D4
_0804BB60: .4byte 0x0203E0D0
_0804BB64:
	ldr r0, _0804BC00 @ =0x0203E0D0
	movs r6, #2
	ldrsh r0, [r0, r6]
_0804BB6A:
	movs r1, #0x64
	bl DivRem
	adds r6, r0, #0
	movs r1, #0xa
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	subs r4, r6, r0
	cmp r5, #0
	bne _0804BB88
	movs r5, #0xa
_0804BB88:
	ldr r0, _0804BC04 @ =0x02019484
	adds r1, r6, #0
	bl EkrModifyBarfx
	lsls r5, r5, #5
	mov r8, r5
	lsls r4, r4, #5
	mov sb, r4
	mov r5, sl
	ldr r4, _0804BC04 @ =0x02019484
	ldr r7, _0804BC08 @ =0x081D9AF0
	movs r6, #0xc
_0804BBA0:
	ldrh r1, [r4]
	lsls r0, r1, #5
	adds r0, r0, r7
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _0804BBA0
	ldr r4, _0804BC0C @ =0x081D9DF0
	mov r2, r8
	adds r0, r2, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	add r4, sb
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, _0804BC10 @ =0x060020E0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	movs r0, #0
	ldr r3, [sp, #8]
	strh r0, [r3, #0x2c]
	ldr r0, _0804BC14 @ =sub_0804BC18
	str r0, [r3, #0xc]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC00: .4byte 0x0203E0D0
_0804BC04: .4byte 0x02019484
_0804BC08: .4byte 0x081D9AF0
_0804BC0C: .4byte 0x081D9DF0
_0804BC10: .4byte 0x060020E0
_0804BC14: .4byte sub_0804BC18

	thumb_func_start sub_0804BC18
sub_0804BC18: @ 0x0804BC18
	adds r2, r0, #0
	ldrh r1, [r2, #0x2c]
	adds r1, #1
	strh r1, [r2, #0x2c]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0804BC38
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r0, _0804BC34 @ =sub_0804BC64
	str r0, [r2, #0xc]
	b _0804BC5E
	.align 2, 0
_0804BC34: .4byte sub_0804BC64
_0804BC38:
	ldr r3, _0804BC60 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r2, #0x6c
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r2, r3, #0
	adds r2, #0x31
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	subs r1, #0x6c
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
_0804BC5E:
	bx lr
	.align 2, 0
_0804BC60: .4byte 0x03002870

	thumb_func_start sub_0804BC64
sub_0804BC64: @ 0x0804BC64
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0804BCC0
	ldr r2, _0804BC88 @ =0x0203E0D4
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0804BC90
	ldr r0, _0804BC8C @ =0x0203E0D0
	ldrh r0, [r0]
	b _0804BC9E
	.align 2, 0
_0804BC88: .4byte 0x0203E0D4
_0804BC8C: .4byte 0x0203E0D0
_0804BC90:
	ldrh r3, [r2, #2]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0804BCA4
	ldr r0, _0804BCC8 @ =0x0203E0D0
	ldrh r0, [r0, #2]
_0804BC9E:
	strh r0, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2e]
_0804BCA4:
	ldr r0, _0804BCCC @ =sub_0804BCD0
	str r0, [r1, #0xc]
	movs r4, #0xe5
	lsls r4, r4, #2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl M4aPlayWithPostionCtrl
_0804BCC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BCC8: .4byte 0x0203E0D0
_0804BCCC: .4byte sub_0804BCD0

	thumb_func_start sub_0804BCD0
sub_0804BCD0: @ 0x0804BCD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0804BD98 @ =0x02019484
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, r8
	mov sl, r1
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	movs r1, #0x64
	bl DivRem
	adds r5, r0, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r6, r5, r0
	cmp r4, #0
	bne _0804BD0C
	movs r4, #0xa
_0804BD0C:
	mov r0, r8
	adds r1, r5, #0
	bl EkrModifyBarfx
	lsls r4, r4, #5
	mov sb, r4
	lsls r6, r6, #5
	str r6, [sp]
	mov r6, sl
	mov r5, r8
	ldr r0, _0804BD9C @ =0x081D9AF0
	mov r8, r0
	movs r4, #0xc
_0804BD26:
	ldrh r1, [r5]
	lsls r0, r1, #5
	add r0, r8
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _0804BD26
	ldr r4, _0804BDA0 @ =0x081D9DF0
	mov r2, sb
	adds r0, r2, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	ldr r0, [sp]
	adds r4, r0, r4
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, _0804BDA4 @ =0x060020E0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804BD86
	movs r0, #0
	strh r0, [r7, #0x2c]
	ldr r0, _0804BDA8 @ =sub_0804BDAC
	str r0, [r7, #0xc]
_0804BD86:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD98: .4byte 0x02019484
_0804BD9C: .4byte 0x081D9AF0
_0804BDA0: .4byte 0x081D9DF0
_0804BDA4: .4byte 0x060020E0
_0804BDA8: .4byte sub_0804BDAC

	thumb_func_start sub_0804BDAC
sub_0804BDAC: @ 0x0804BDAC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0804BDC0
	movs r0, #0xe5
	lsls r0, r0, #2
	bl DoM4aSongNumStop
_0804BDC0:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _0804BDD6
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0804BDDC @ =sub_0804BDE0
	str r0, [r4, #0xc]
_0804BDD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDDC: .4byte sub_0804BDE0

	thumb_func_start sub_0804BDE0
sub_0804BDE0: @ 0x0804BDE0
	adds r1, r0, #0
	ldrh r2, [r1, #0x2c]
	adds r2, #1
	strh r2, [r1, #0x2c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0804BE00
	movs r0, #0
	strh r0, [r1, #0x2c]
	ldr r0, _0804BDFC @ =EkrBattleLvupHanlder
	str r0, [r1, #0xc]
	b _0804BE26
	.align 2, 0
_0804BDFC: .4byte EkrBattleLvupHanlder
_0804BE00:
	ldr r3, _0804BE28 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	subs r0, #0x78
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
_0804BE26:
	bx lr
	.align 2, 0
_0804BE28: .4byte 0x03002870

	thumb_func_start EkrBattleLvupHanlder
EkrBattleLvupHanlder: @ 0x0804BE2C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _0804BE70
	ldr r2, _0804BE54 @ =0x0203E0D4
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0804BE5C
	ldr r0, _0804BE58 @ =0x0203E0D0
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _0804BE66
	.align 2, 0
_0804BE54: .4byte 0x0203E0D4
_0804BE58: .4byte 0x0203E0D0
_0804BE5C:
	ldr r0, _0804BEDC @ =0x0203E0D0
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_0804BE66:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _0804BE70
	bl NewEkrLvlupFan
_0804BE70:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x28
	ble _0804BF08
	bl SpellFx_ClearBG1
	movs r0, #0
	bl EkrGauge_0804CC68
	ldr r3, _0804BEE0 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
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
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldr r2, _0804BEE4 @ =0x0203E0D4
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _0804BEE8
	ldr r0, _0804BEDC @ =0x0203E0D0
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _0804BEF2
	.align 2, 0
_0804BEDC: .4byte 0x0203E0D0
_0804BEE0: .4byte 0x03002870
_0804BEE4: .4byte 0x0203E0D4
_0804BEE8:
	ldr r0, _0804BEFC @ =0x0203E0D0
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_0804BEF2:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _0804BF04
	ldr r0, _0804BF00 @ =EkrBattleExecEkrLvup
	b _0804BF06
	.align 2, 0
_0804BEFC: .4byte 0x0203E0D0
_0804BF00: .4byte EkrBattleExecEkrLvup
_0804BF04:
	ldr r0, _0804BF10 @ =EkrBattleExecPopup
_0804BF06:
	str r0, [r4, #0xc]
_0804BF08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF10: .4byte EkrBattleExecPopup

	thumb_func_start EkrBattleExecEkrLvup
EkrBattleExecEkrLvup: @ 0x0804BF14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BF28 @ =0x0203E0D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0804BF30
	ldr r0, _0804BF2C @ =0x02000000
	ldr r0, [r0]
	b _0804BF34
	.align 2, 0
_0804BF28: .4byte 0x0203E0D4
_0804BF2C: .4byte 0x02000000
_0804BF30:
	ldr r0, _0804BF44 @ =0x02000000
	ldr r0, [r0, #8]
_0804BF34:
	bl NewEkrLevelup
	ldr r0, _0804BF48 @ =EkrBattleWaitLvup
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF44: .4byte 0x02000000
_0804BF48: .4byte EkrBattleWaitLvup

	thumb_func_start EkrBattleWaitLvup
EkrBattleWaitLvup: @ 0x0804BF4C
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrLvupDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BF64
	bl EndEkrLevelUp
	ldr r0, _0804BF6C @ =EkrBattleExecPopup
	str r0, [r4, #0xc]
_0804BF64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF6C: .4byte EkrBattleExecPopup

	thumb_func_start EkrBattleExecPopup
EkrBattleExecPopup: @ 0x0804BF70
	push {r4, lr}
	adds r4, r0, #0
	bl NewEkrPopup
	ldr r0, _0804BF84 @ =EkrBattleWaitPopup
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF84: .4byte EkrBattleWaitPopup

	thumb_func_start EkrBattleWaitPopup
EkrBattleWaitPopup: @ 0x0804BF88
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrPopupDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804BFA0
	bl EndEkrPopup
	ldr r0, _0804BFA8 @ =EkrBattlePrepareEnding
	str r0, [r4, #0xc]
_0804BFA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFA8: .4byte EkrBattlePrepareEnding

	thumb_func_start EkrBattlePrepareEnding
EkrBattlePrepareEnding: @ 0x0804BFAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804BFDC @ =0x02000000
	ldr r0, [r4]
	bl EndEfxStatusUnits
	ldr r0, [r4, #8]
	bl EndEfxStatusUnits
	bl EndProcEfxWeaponIcon
	bl EndEfxHPBarColorChange
	ldr r0, _0804BFE0 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	str r0, [r5, #0x44]
	movs r0, #0
	str r0, [r5, #0x48]
	ldr r0, _0804BFE4 @ =EkrBattleStartDragonEnding
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFDC: .4byte 0x02000000
_0804BFE0: .4byte 0x0203E00C
_0804BFE4: .4byte EkrBattleStartDragonEnding

	thumb_func_start EkrBattleStartDragonEnding
EkrBattleStartDragonEnding: @ 0x0804BFE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _0804BFFC
	ldr r0, _0804BFF8 @ =EkrBattlePostDragonEnding
	str r0, [r4, #0xc]
	b _0804C04A
	.align 2, 0
_0804BFF8: .4byte EkrBattlePostDragonEnding
_0804BFFC:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0804C028
	ldr r0, _0804C020 @ =0x02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804C01A
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonExit
	ldr r0, _0804C024 @ =EkrBattleWaitDragonEnding
	str r0, [r4, #0xc]
_0804C01A:
	movs r0, #1
	b _0804C042
	.align 2, 0
_0804C020: .4byte 0x02000000
_0804C024: .4byte EkrBattleWaitDragonEnding
_0804C028:
	ldr r0, _0804C050 @ =0x02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #0
	beq _0804C040
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonExit
	ldr r0, _0804C054 @ =EkrBattleWaitDragonEnding
	str r0, [r4, #0xc]
_0804C040:
	movs r0, #0
_0804C042:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_0804C04A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C050: .4byte 0x02000000
_0804C054: .4byte EkrBattleWaitDragonEnding

	thumb_func_start EkrBattleWaitDragonEnding
EkrBattleWaitDragonEnding: @ 0x0804C058
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl CheckEkrDragonEndingDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804C06E
	ldr r0, _0804C074 @ =EkrBattleStartDragonEnding
	str r0, [r4, #0xc]
_0804C06E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C074: .4byte EkrBattleStartDragonEnding

	thumb_func_start EkrBattlePostDragonEnding
EkrBattlePostDragonEnding: @ 0x0804C078
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804C0A4 @ =0x02017724
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804C0A8 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804C09A
	movs r0, #2
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl EkrRestoreBGM
_0804C09A:
	ldr r0, _0804C0AC @ =EkrBattlePostEndDelay
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C0A4: .4byte 0x02017724
_0804C0A8: .4byte 0x0203E008
_0804C0AC: .4byte EkrBattlePostEndDelay

	thumb_func_start EkrBattlePostEndDelay
EkrBattlePostEndDelay: @ 0x0804C0B0
	bx lr
	.align 2, 0

	thumb_func_start NewEkrLvlupFan
NewEkrLvlupFan: @ 0x0804C0B4
	push {lr}
	ldr r0, _0804C0CC @ =0x08B9A9E4
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r0, #0x80
	bl SetBgmVolume
	pop {r0}
	bx r0
	.align 2, 0
_0804C0CC: .4byte 0x08B9A9E4

	thumb_func_start EkrLvupFanMain
EkrLvupFanMain: @ 0x0804C0D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0804C100
	ldr r4, _0804C0FC @ =0x0000037B
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	b _0804C112
	.align 2, 0
_0804C0FC: .4byte 0x0000037B
_0804C100:
	cmp r0, #0x74
	bne _0804C112
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
_0804C112:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804C118
sub_0804C118: @ 0x0804C118
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r5, r7, #0
_0804C124:
	movs r0, #0xf
	ldrh r1, [r4]
	cmp r1, #0xff
	beq _0804C12E
	ldrh r0, [r4]
_0804C12E:
	lsls r0, r0, #5
	ldr r1, _0804C160 @ =0x081D93B0
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #2
	adds r5, #0x20
	adds r6, #1
	cmp r6, #0xa
	bls _0804C124
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r2, _0804C164 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C160: .4byte 0x081D93B0
_0804C164: .4byte 0x01000008

	thumb_func_start sub_0804C168
sub_0804C168: @ 0x0804C168
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _0804C184
	movs r0, #0xb
	strh r0, [r5]
	movs r0, #0xa
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	b _0804C1CA
_0804C184:
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	movs r0, #0x64
	ldrh r1, [r5]
	adds r4, r1, #0
	muls r4, r0, r4
	subs r4, r6, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	strh r0, [r5, #2]
	lsls r0, r0, #2
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	lsls r0, r0, #1
	subs r4, r4, r0
	strh r4, [r5, #4]
	adds r1, r2, #0
	ldrh r2, [r5]
	adds r0, r1, r2
	cmp r0, #0
	bne _0804C1C0
	movs r0, #0xb
	strh r0, [r5, #2]
_0804C1C0:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0804C1CA
	movs r0, #0xb
	strh r0, [r5]
_0804C1CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start NewEkrGauge
NewEkrGauge: @ 0x0804C1D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, _0804C21C @ =0x02000068
	ldr r0, _0804C220 @ =0x08B9A9FC
	movs r1, #1
	bl SpawnProc
	str r0, [r4]
	movs r0, #0
	bl EkrGauge_0804CC68
	bl EkrGauge_0804CC28
	bl DisableEkrGauge
	bl EkrGauge_ClrInitFlag
	ldr r1, _0804C224 @ =0x02000038
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl EkrGauge_0804CC78
	ldr r0, _0804C228 @ =0x0203E0B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _0804C234
	ldr r0, _0804C22C @ =0x081D9730
	ldr r1, _0804C230 @ =0x02022BC0
	movs r2, #0x10
	bl CpuSet
	b _0804C248
	.align 2, 0
_0804C21C: .4byte 0x02000068
_0804C220: .4byte 0x08B9A9FC
_0804C224: .4byte 0x02000038
_0804C228: .4byte 0x0203E0B8
_0804C22C: .4byte 0x081D9730
_0804C230: .4byte 0x02022BC0
_0804C234:
	ldr r0, _0804C260 @ =0x0203E020
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0804C264 @ =0x081D95B0
	adds r0, r0, r1
	ldr r1, _0804C268 @ =0x02022BC0
	movs r2, #0x10
	bl CpuSet
_0804C248:
	ldr r0, _0804C26C @ =0x0203E0B8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _0804C278
	ldr r0, _0804C270 @ =0x081D9730
	ldr r1, _0804C274 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
	b _0804C28C
	.align 2, 0
_0804C260: .4byte 0x0203E020
_0804C264: .4byte 0x081D95B0
_0804C268: .4byte 0x02022BC0
_0804C26C: .4byte 0x0203E0B8
_0804C270: .4byte 0x081D9730
_0804C274: .4byte 0x02022BE0
_0804C278:
	ldr r0, _0804C3DC @ =0x0203E020
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0804C3E0 @ =0x081D95B0
	adds r0, r0, r1
	ldr r1, _0804C3E4 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
_0804C28C:
	ldr r1, _0804C3E8 @ =0x0203E0C0
	ldr r2, _0804C3EC @ =0x0000FFFF
	adds r0, r2, #0
	ldrh r2, [r1]
	orrs r2, r0
	strh r2, [r1]
	ldrh r2, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldr r0, _0804C3F0 @ =0x081D9020
	ldr r1, _0804C3F4 @ =0x06013800
	bl LZ77UnCompVram
	ldr r0, _0804C3F8 @ =0x081D90C0
	ldr r1, _0804C3FC @ =0x06013C00
	bl LZ77UnCompVram
	ldr r6, _0804C3DC @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _0804C400 @ =0x081D9330
	adds r0, r0, r5
	ldr r4, _0804C404 @ =0x02022B00
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r6, _0804C408 @ =0x0203E0C4
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r7, _0804C40C @ =0x02017700
	adds r1, r7, #0
	bl sub_0804C168
	ldr r5, _0804C410 @ =0x0203E0C8
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r7, #6
	bl sub_0804C168
	ldr r4, _0804C414 @ =0x0203E0CC
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r7, #0
	adds r1, #0xc
	bl sub_0804C168
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r7, #0
	adds r1, #0x12
	bl sub_0804C168
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r1, r7, #0
	adds r1, #0x18
	bl sub_0804C168
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r1, r7, #0
	adds r1, #0x1e
	bl sub_0804C168
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804C418 @ =0x020169C8
	ldr r2, _0804C41C @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	movs r6, #0
	mov sb, r7
_0804C338:
	movs r5, #0
	lsls r3, r6, #1
	adds r0, r6, #1
	mov r8, r0
	lsls r4, r6, #7
_0804C342:
	adds r0, r3, r6
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _0804C420 @ =0x081D9170
	adds r0, r0, r1
	ldr r7, _0804C418 @ =0x020169C8
	adds r1, r4, r7
	movs r2, #0x10
	str r3, [sp, #4]
	bl CpuSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp, #4]
	cmp r5, #2
	bls _0804C342
	mov r6, r8
	cmp r6, #5
	bls _0804C338
	ldr r1, _0804C424 @ =0x06013A00
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r7, #0
	adds r2, r4, #0
	bl RegisterDataMove
	adds r0, r7, r4
	ldr r1, _0804C428 @ =0x06013E00
	adds r2, r4, #0
	bl RegisterDataMove
	bl InitIcons
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, _0804C42C @ =0x0203E094
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	movs r1, #0xee
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, _0804C430 @ =0x0203E098
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	movs r1, #0xef
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, _0804C434 @ =0x0819431C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C3DC: .4byte 0x0203E020
_0804C3E0: .4byte 0x081D95B0
_0804C3E4: .4byte 0x02022BE0
_0804C3E8: .4byte 0x0203E0C0
_0804C3EC: .4byte 0x0000FFFF
_0804C3F0: .4byte 0x081D9020
_0804C3F4: .4byte 0x06013800
_0804C3F8: .4byte 0x081D90C0
_0804C3FC: .4byte 0x06013C00
_0804C400: .4byte 0x081D9330
_0804C404: .4byte 0x02022B00
_0804C408: .4byte 0x0203E0C4
_0804C40C: .4byte 0x02017700
_0804C410: .4byte 0x0203E0C8
_0804C414: .4byte 0x0203E0CC
_0804C418: .4byte 0x020169C8
_0804C41C: .4byte 0x01000100
_0804C420: .4byte 0x081D9170
_0804C424: .4byte 0x06013A00
_0804C428: .4byte 0x06013E00
_0804C42C: .4byte 0x0203E094
_0804C430: .4byte 0x0203E098
_0804C434: .4byte 0x0819431C

	thumb_func_start EndEkrGauge
EndEkrGauge: @ 0x0804C438
	push {lr}
	ldr r0, _0804C448 @ =0x02000068
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804C448: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC28
EkrGauge_0804CC28: @ 0x0804C44C
	ldr r0, _0804C458 @ =0x02000068
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804C458: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC38
EkrGauge_0804CC38: @ 0x0804C45C
	ldr r0, _0804C468 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804C468: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC48
EkrGauge_0804CC48: @ 0x0804C46C
	ldr r0, _0804C478 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0804C478: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC58
EkrGauge_0804CC58: @ 0x0804C47C
	ldr r0, _0804C488 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804C488: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC68
EkrGauge_0804CC68: @ 0x0804C48C
	lsls r0, r0, #0x10
	ldr r1, _0804C498 @ =0x02000068
	ldr r1, [r1]
	lsrs r0, r0, #6
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
_0804C498: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC78
EkrGauge_0804CC78: @ 0x0804C49C
	ldr r2, _0804C4AC @ =0x02000068
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_0804C4AC: .4byte 0x02000068

	thumb_func_start EkrGauge_0804CC8C
EkrGauge_0804CC8C: @ 0x0804C4B0
	ldr r2, _0804C4C0 @ =0x02000068
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0804C4C0: .4byte 0x02000068

	thumb_func_start EkrGauge_SetInitFlag
EkrGauge_SetInitFlag: @ 0x0804C4C4
	ldr r0, _0804C4D0 @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C4D0: .4byte 0x02000068

	thumb_func_start EkrGauge_ClrInitFlag
EkrGauge_ClrInitFlag: @ 0x0804C4D4
	ldr r0, _0804C4E0 @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C4E0: .4byte 0x02000068

	thumb_func_start EnableEkrGauge
EnableEkrGauge: @ 0x0804C4E4
	ldr r0, _0804C4F0 @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C4F0: .4byte 0x02000068

	thumb_func_start DisableEkrGauge
DisableEkrGauge: @ 0x0804C4F4
	ldr r0, _0804C500 @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C500: .4byte 0x02000068

	thumb_func_start sub_0804C504
sub_0804C504: @ 0x0804C504
	adds r3, r0, #0
	cmp r1, #0
	ble _0804C52C
	cmp r2, #1
	beq _0804C51C
	cmp r2, #1
	bhs _0804C524
	ldr r0, _0804C518 @ =0x08B9AB1C
	b _0804C546
	.align 2, 0
_0804C518: .4byte 0x08B9AB1C
_0804C51C:
	ldr r0, _0804C520 @ =0x08B9AB34
	b _0804C546
	.align 2, 0
_0804C520: .4byte 0x08B9AB34
_0804C524:
	ldr r0, _0804C528 @ =0x08B9AB4C
	b _0804C546
	.align 2, 0
_0804C528: .4byte 0x08B9AB4C
_0804C52C:
	cmp r2, #1
	beq _0804C53C
	cmp r2, #1
	bhs _0804C544
	ldr r0, _0804C538 @ =0x08B9AB64
	b _0804C546
	.align 2, 0
_0804C538: .4byte 0x08B9AB64
_0804C53C:
	ldr r0, _0804C540 @ =0x08B9AB7C
	b _0804C546
	.align 2, 0
_0804C540: .4byte 0x08B9AB7C
_0804C544:
	ldr r0, _0804C54C @ =0x08B9AB94
_0804C546:
	str r0, [r3, #0x3c]
	bx lr
	.align 2, 0
_0804C54C: .4byte 0x08B9AB94

	thumb_func_start sub_0804C550
sub_0804C550: @ 0x0804C550
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x120
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0xd8]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl DivRem
	str r0, [sp, #0xe4]
	mov r0, sb
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804C57C
	b _0804CD20
_0804C57C:
	mov r0, sb
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #0x108]
	cmp r1, #0
	bne _0804C66A
	mov r1, sb
	ldrh r1, [r1, #0x3a]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x13
	lsls r0, r4, #5
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r7, r0, r2
	cmp r7, #0
	bge _0804C59E
	movs r7, #0
_0804C59E:
	adds r6, r4, #7
	cmp r6, #7
	ble _0804C5A6
	movs r6, #7
_0804C5A6:
	movs r0, #7
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, _0804C5C8 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _0804C5CC
	cmp r0, #2
	bgt _0804C5CC
	movs r4, #0
	movs r0, #0xf
	str r0, [sp, #0xdc]
	b _0804C5D2
	.align 2, 0
_0804C5C8: .4byte 0x0203E02C
_0804C5CC:
	movs r1, #8
	str r1, [sp, #0xdc]
	movs r4, #8
_0804C5D2:
	ldr r2, _0804C6B8 @ =0x02022FA0
	mov r8, r2
	movs r0, #0x9f
	str r0, [sp]
	mov r0, r8
	movs r1, #0x1e
	movs r2, #8
	movs r3, #0
	bl FillBGRect
	mov r3, sb
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne _0804C624
	ldr r0, _0804C6BC @ =0x081D8D9C
	add r0, sl
	lsls r5, r7, #1
	lsls r1, r4, #1
	ldr r2, _0804C6C0 @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_0806693C
_0804C624:
	mov r4, sb
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0804C664
	ldr r0, _0804C6C4 @ =0x081D8E70
	add r0, sl
	lsls r5, r7, #1
	ldr r2, [sp, #0xdc]
	lsls r1, r2, #1
	ldr r2, _0804C6C0 @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	movs r3, #3
	bl sub_0806693C
_0804C664:
	movs r0, #1
	bl EnableBgSync
_0804C66A:
	ldr r1, _0804C6C8 @ =0x0203E0C0
	ldr r0, _0804C6CC @ =0x0203E0B8
	ldrh r2, [r0]
	adds r5, r0, #0
	ldrh r3, [r1]
	ldrh r4, [r5]
	cmp r3, r4
	beq _0804C67E
	movs r0, #1
	str r0, [sp, #0xd8]
_0804C67E:
	ldrh r0, [r5, #2]
	ldrh r3, [r1, #2]
	cmp r3, r0
	beq _0804C68A
	movs r4, #1
	str r4, [sp, #0xd8]
_0804C68A:
	strh r2, [r1]
	strh r0, [r1, #2]
	ldrh r7, [r5]
	ldr r0, _0804C6D0 @ =0x0203E0BC
	ldrh r6, [r0]
	ldrh r1, [r5, #2]
	mov r8, r1
	ldrh r0, [r0, #2]
	str r0, [sp, #0xd4]
	ldr r0, _0804C6D4 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #3
	beq _0804C6D8
	cmp r0, #3
	bgt _0804C6F8
	cmp r0, #0
	blt _0804C6F8
	mov r3, sb
	movs r4, #0x32
	ldrsh r3, [r3, r4]
	mov sl, r3
	b _0804C702
	.align 2, 0
_0804C6B8: .4byte 0x02022FA0
_0804C6BC: .4byte 0x081D8D9C
_0804C6C0: .4byte 0xFFFFFCC0
_0804C6C4: .4byte 0x081D8E70
_0804C6C8: .4byte 0x0203E0C0
_0804C6CC: .4byte 0x0203E0B8
_0804C6D0: .4byte 0x0203E0BC
_0804C6D4: .4byte 0x0203E02C
_0804C6D8:
	ldr r0, _0804C6EC @ =0x0203E010
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804C6F0
	mov r1, sb
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	adds r0, #0x38
	b _0804C700
	.align 2, 0
_0804C6EC: .4byte 0x0203E010
_0804C6F0:
	mov r3, sb
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	b _0804C6FE
_0804C6F8:
	mov r1, sb
	movs r2, #0x32
	ldrsh r0, [r1, r2]
_0804C6FE:
	subs r0, #0x38
_0804C700:
	mov sl, r0
_0804C702:
	ldr r3, [sp, #0x108]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804C71C
	ldr r4, _0804C718 @ =0x0000FFF8
	mov r0, sb
	ldrh r1, [r0, #0x3a]
	ands r1, r4
	str r1, [sp, #0xe0]
	b _0804C724
	.align 2, 0
_0804C718: .4byte 0x0000FFF8
_0804C71C:
	mov r2, sb
	movs r3, #0x3a
	ldrsh r2, [r2, r3]
	str r2, [sp, #0xe0]
_0804C724:
	adds r4, r5, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Div
	add r2, sp, #0x68
	strh r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r3, [r4]
	subs r1, r3, r1
	strh r1, [r2, #2]
	lsls r0, r0, #0x10
	adds r3, r2, #0
	cmp r0, #0
	bne _0804C74C
	movs r0, #0xb
	strh r0, [r3]
_0804C74C:
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	str r3, [sp, #0x11c]
	bl Div
	ldr r3, [sp, #0x11c]
	strh r0, [r3, #4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r2, [r4, #2]
	subs r1, r2, r1
	strh r1, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804C772
	movs r0, #0xb
	strh r0, [r3, #4]
_0804C772:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _0804C780
	movs r0, #0xc
	strh r0, [r3]
	strh r0, [r3, #2]
_0804C780:
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0x50
	ble _0804C78E
	movs r0, #0xc
	strh r0, [r3, #4]
	strh r0, [r3, #6]
_0804C78E:
	mov r4, sl
	adds r4, #9
	str r4, [sp, #0xf4]
	ldr r0, [sp, #0xe0]
	adds r0, #0x91
	str r0, [sp, #0x114]
	mov r1, sl
	adds r1, #0x81
	str r1, [sp, #0x110]
	lsls r2, r7, #0x10
	str r2, [sp, #0xf8]
	lsls r6, r6, #0x10
	str r6, [sp, #0xfc]
	adds r4, #0x14
	str r4, [sp, #0x10c]
	mov r0, r8
	lsls r0, r0, #0x10
	str r0, [sp, #0x100]
	ldr r1, [sp, #0xd4]
	lsls r1, r1, #0x10
	str r1, [sp, #0x104]
	mov r2, sl
	adds r2, #0x95
	str r2, [sp, #0x118]
	ldr r4, [sp, #0xd8]
	cmp r4, #1
	bne _0804C820
	add r0, sp, #0xd0
	movs r1, #0
	str r1, [r0]
	ldr r1, _0804C858 @ =0x02016DC8
	ldr r2, _0804C85C @ =0x01000020
	str r3, [sp, #0x11c]
	bl CpuFastSet
	movs r0, #0
	ldr r3, [sp, #0x11c]
_0804C7D8:
	adds r1, r0, #1
	mov r8, r1
	lsls r5, r0, #6
	lsls r0, r0, #2
	adds r4, r0, r3
	movs r6, #1
_0804C7E4:
	ldrh r2, [r4]
	lsls r0, r2, #5
	ldr r1, _0804C860 @ =0x081D9170
	adds r0, r0, r1
	ldr r7, _0804C858 @ =0x02016DC8
	adds r1, r5, r7
	movs r2, #0x10
	str r3, [sp, #0x11c]
	bl CpuSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	ldr r3, [sp, #0x11c]
	cmp r6, #0
	bge _0804C7E4
	mov r0, r8
	cmp r0, #1
	ble _0804C7D8
	ldr r1, _0804C864 @ =0x060139C0
	adds r0, r7, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _0804C868 @ =0x06013DC0
	movs r2, #0x40
	bl RegisterDataMove
_0804C820:
	add r0, sp, #8
	movs r4, #0
	ldr r1, _0804C86C @ =0x000051CE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf4
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x114
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #0
	bl EkrEfxIsUnitHittedNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _0804C874
	ldr r0, _0804C870 @ =0x08B9AA44
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0804C89E
	.align 2, 0
_0804C858: .4byte 0x02016DC8
_0804C85C: .4byte 0x01000020
_0804C860: .4byte 0x081D9170
_0804C864: .4byte 0x060139C0
_0804C868: .4byte 0x06013DC0
_0804C86C: .4byte 0x000051CE
_0804C870: .4byte 0x08B9AA44
_0804C874:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0804C8E8 @ =0x08B9AA44
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl BanimUpdateSpriteRotScale
_0804C89E:
	mov r3, sb
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne _0804C8AC
	add r0, sp, #8
	bl AnimDisplay
_0804C8AC:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #8
	ldr r1, _0804C8EC @ =0x000061EE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0x110
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x114
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #1
	bl EkrEfxIsUnitHittedNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _0804C8F0
	ldr r0, _0804C8E8 @ =0x08B9AA44
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0804C91A
	.align 2, 0
_0804C8E8: .4byte 0x08B9AA44
_0804C8EC: .4byte 0x000061EE
_0804C8F0:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0804CA14 @ =0x08B9AA44
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl BanimUpdateSpriteRotScale
_0804C91A:
	mov r3, sb
	ldr r0, [r3, #0x50]
	cmp r0, #0
	bne _0804C928
	add r0, sp, #8
	bl AnimDisplay
_0804C928:
	ldr r4, [sp, #0xf8]
	ldr r0, _0804CA18 @ =0xFFD80000
	adds r1, r4, r0
	ldr r2, [sp, #0xfc]
	adds r0, r2, r0
	lsrs r5, r0, #0x10
	lsrs r7, r4, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _0804C944
	movs r6, #0x28
_0804C944:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804C94E
	movs r5, #0x28
_0804C94E:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _0804C956
	movs r6, #0
_0804C956:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _0804C95E
	movs r5, #0
_0804C95E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804C968
	movs r7, #0x28
_0804C968:
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804C976
	movs r4, #0x28
	mov r8, r4
_0804C976:
	add r0, sp, #8
	movs r3, #0
	movs r1, #0xb0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sb
	ldr r0, [r4, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	str r3, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x10c
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0804CA1C @ =0x08B9AA14
	str r0, [sp, #0x44]
	ldr r2, [r4, #0x4c]
	str r2, [sp, #0xe8]
	cmp r2, #0
	bne _0804CA4C
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	add r4, sp, #0x50
	cmp r2, #0
	beq _0804C9E6
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08066CA0
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _0804C9C2
	ldr r1, _0804CA20 @ =0x02016E48
	adds r0, r4, #0
	bl sub_0804C118
_0804C9C2:
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	strh r0, [r1, #8]
	adds r0, r1, #0
	add r1, sp, #0xe8
	ldrh r1, [r1]
	strh r1, [r0, #0xc]
	bl AnimDisplay
_0804C9E6:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_08066CA0
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _0804CA04
	ldr r1, _0804CA24 @ =0x02017248
	adds r0, r4, #0
	bl sub_0804C118
_0804CA04:
	cmp r5, #0
	beq _0804CA28
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _0804CA30
	.align 2, 0
_0804CA14: .4byte 0x08B9AA44
_0804CA18: .4byte 0xFFD80000
_0804CA1C: .4byte 0x08B9AA14
_0804CA20: .4byte 0x02016E48
_0804CA24: .4byte 0x02017248
_0804CA28:
	add r0, sp, #8
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #4]
_0804CA30:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_0804CA4C:
	ldr r2, [sp, #0x100]
	ldr r3, _0804CB44 @ =0xFFD80000
	adds r1, r2, r3
	ldr r4, [sp, #0x104]
	adds r0, r4, r3
	lsrs r5, r0, #0x10
	lsrs r7, r2, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _0804CA68
	movs r6, #0x28
_0804CA68:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804CA72
	movs r5, #0x28
_0804CA72:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _0804CA7A
	movs r6, #0
_0804CA7A:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _0804CA82
	movs r5, #0
_0804CA82:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804CA8C
	movs r7, #0x28
_0804CA8C:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804CA9A
	movs r2, #0x28
	mov r8, r2
_0804CA9A:
	add r0, sp, #8
	movs r3, #0
	mov ip, r3
	movs r1, #0xc0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sb
	ldr r0, [r4, #0x44]
	add r4, sp, #0xec
	strh r3, [r4]
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, ip
	str r0, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x118
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0804CB48 @ =0x08B9AA14
	str r0, [sp, #0x44]
	mov r2, sb
	ldr r2, [r2, #0x50]
	str r2, [sp, #0xf0]
	cmp r2, #0
	bne _0804CB78
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	add r4, sp, #0x50
	cmp r2, #0
	beq _0804CB16
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08066CA0
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _0804CAF2
	ldr r1, _0804CB4C @ =0x02017048
	adds r0, r4, #0
	bl sub_0804C118
_0804CAF2:
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf0
	ldrh r1, [r1]
	strh r1, [r0, #0xc]
	bl AnimDisplay
_0804CB16:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_08066CA0
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _0804CB34
	ldr r1, _0804CB50 @ =0x02017448
	adds r0, r4, #0
	bl sub_0804C118
_0804CB34:
	cmp r5, #0
	beq _0804CB54
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _0804CB5C
	.align 2, 0
_0804CB44: .4byte 0xFFD80000
_0804CB48: .4byte 0x08B9AA14
_0804CB4C: .4byte 0x02017048
_0804CB50: .4byte 0x02017448
_0804CB54:
	add r0, sp, #8
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #4]
_0804CB5C:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x30
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_0804CB78:
	ldr r2, [sp, #0xd8]
	cmp r2, #1
	bne _0804CB8A
	ldr r0, _0804CD30 @ =0x02016E48
	ldr r1, _0804CD34 @ =0x06013000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
_0804CB8A:
	mov r3, sb
	ldr r4, [r3, #0x4c]
	cmp r4, #0
	bne _0804CBE8
	str r4, [sp, #0x24]
	ldr r0, _0804CD38 @ =0x08B9AA5C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD3C @ =0x000051D0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0xf
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _0804CD40 @ =0x08B9AA8C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD44 @ =0x000051C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x65
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CBE8:
	mov r0, sb
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne _0804CC48
	str r4, [sp, #0x24]
	ldr r0, _0804CD38 @ =0x08B9AA5C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD48 @ =0x000061F0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0xd7
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _0804CD4C @ =0x08B9AAC8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD50 @ =0x000061C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x87
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CC48:
	mov r0, sb
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne _0804CCB4
	str r4, [sp, #0x24]
	ldr r1, _0804CD54 @ =0x0203E0E0
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe0]
	adds r5, #0x7a
	cmp r0, #0
	beq _0804CC8E
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe4]
	bl sub_0804C504
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x35
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CC8E:
	ldr r0, _0804CD58 @ =0x08B9AB04
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD5C @ =0x0000D1DC
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x2b
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CCB4:
	mov r0, sb
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne _0804CD20
	str r4, [sp, #0x24]
	ldr r1, _0804CD54 @ =0x0203E0E0
	movs r2, #2
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe0]
	adds r5, #0x7a
	cmp r0, #0
	beq _0804CCFA
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe4]
	bl sub_0804C504
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x84
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CCFA:
	ldr r0, _0804CD58 @ =0x08B9AB04
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD60 @ =0x0000E1DE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x7a
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CD20:
	add sp, #0x120
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD30: .4byte 0x02016E48
_0804CD34: .4byte 0x06013000
_0804CD38: .4byte 0x08B9AA5C
_0804CD3C: .4byte 0x000051D0
_0804CD40: .4byte 0x08B9AA8C
_0804CD44: .4byte 0x000051C0
_0804CD48: .4byte 0x000061F0
_0804CD4C: .4byte 0x08B9AAC8
_0804CD50: .4byte 0x000061C0
_0804CD54: .4byte 0x0203E0E0
_0804CD58: .4byte 0x08B9AB04
_0804CD5C: .4byte 0x0000D1DC
_0804CD60: .4byte 0x0000E1DE

	thumb_func_start NewEkrDispUP
NewEkrDispUP: @ 0x0804CD64
	push {r4, lr}
	ldr r4, _0804CD8C @ =0x0200006C
	ldr r0, _0804CD90 @ =0x08B9ABAC
	movs r1, #5
	bl SpawnProc
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_SetPositionUnsync
	bl EkrDispUP_0804D584
	bl UnAsyncEkrDispUP
	bl UnsyncEkrDispUP
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD8C: .4byte 0x0200006C
_0804CD90: .4byte 0x08B9ABAC

	thumb_func_start EndEkrDispUP
EndEkrDispUP: @ 0x0804CD94
	push {lr}
	ldr r0, _0804CDA4 @ =0x0200006C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804CDA4: .4byte 0x0200006C

	thumb_func_start EkrDispUP_0804D584
EkrDispUP_0804D584: @ 0x0804CDA8
	ldr r0, _0804CDB4 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CDB4: .4byte 0x0200006C

	thumb_func_start sub_0804CDB8
sub_0804CDB8: @ 0x0804CDB8
	ldr r0, _0804CDC4 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CDC4: .4byte 0x0200006C

	thumb_func_start EkrDispUP_0804D5A4
EkrDispUP_0804D5A4: @ 0x0804CDC8
	ldr r0, _0804CDD4 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0804CDD4: .4byte 0x0200006C

	thumb_func_start EkrDispUP_0804D5B4
EkrDispUP_0804D5B4: @ 0x0804CDD8
	ldr r0, _0804CDE4 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CDE4: .4byte 0x0200006C

	thumb_func_start EkrDispUP_SetPositionUnsync
EkrDispUP_SetPositionUnsync: @ 0x0804CDE8
	ldr r2, _0804CDF8 @ =0x0200006C
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_0804CDF8: .4byte 0x0200006C

	thumb_func_start EkrDispUP_SetPositionSync
EkrDispUP_SetPositionSync: @ 0x0804CDFC
	ldr r2, _0804CE0C @ =0x0200006C
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0804CE0C: .4byte 0x0200006C

	thumb_func_start SyncEkrDispUP
SyncEkrDispUP: @ 0x0804CE10
	ldr r0, _0804CE1C @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CE1C: .4byte 0x0200006C

	thumb_func_start UnsyncEkrDispUP
UnsyncEkrDispUP: @ 0x0804CE20
	ldr r0, _0804CE2C @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CE2C: .4byte 0x0200006C

	thumb_func_start AsyncEkrDispUP
AsyncEkrDispUP: @ 0x0804CE30
	ldr r0, _0804CE3C @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CE3C: .4byte 0x0200006C

	thumb_func_start UnAsyncEkrDispUP
UnAsyncEkrDispUP: @ 0x0804CE40
	ldr r0, _0804CE4C @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CE4C: .4byte 0x0200006C

	thumb_func_start ekrDispUPMain
ekrDispUPMain: @ 0x0804CE50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804CF40
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CF40
	ldrh r1, [r7, #0x3a]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	lsls r2, r0, #5
	mov r8, r2
	cmp r2, #0
	bge _0804CE82
	movs r1, #0
	mov r8, r1
_0804CE82:
	adds r6, r0, #7
	cmp r6, #6
	ble _0804CE8A
	movs r6, #6
_0804CE8A:
	movs r0, #6
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, _0804CEA8 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _0804CEAC
	cmp r0, #2
	bgt _0804CEAC
	movs r4, #0
	b _0804CEAE
	.align 2, 0
_0804CEA8: .4byte 0x0203E02C
_0804CEAC:
	movs r4, #0xf
_0804CEAE:
	ldr r0, _0804CF50 @ =0x02022C60
	mov sb, r0
	movs r0, #0x9f
	str r0, [sp]
	mov r0, sb
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl FillBGRect
	cmp r6, #0
	ble _0804CF3A
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne _0804CF00
	ldr r0, _0804CF54 @ =0x081D8C34
	add r0, sl
	mov r1, r8
	lsls r5, r1, #1
	lsls r1, r4, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_0806693C
_0804CF00:
	ldr r0, [r7, #0x50]
	cmp r0, #0
	bne _0804CF3A
	ldr r0, _0804CF58 @ =0x081D8CE8
	add r0, sl
	mov r2, r8
	lsls r5, r2, #1
	movs r2, #0xf
	lsls r1, r2, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #3
	bl sub_0806693C
_0804CF3A:
	movs r0, #1
	bl EnableBgSync
_0804CF40:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CF50: .4byte 0x02022C60
_0804CF54: .4byte 0x081D8C34
_0804CF58: .4byte 0x081D8CE8

	thumb_func_start EfxClearScreenFx
EfxClearScreenFx: @ 0x0804CF5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, _0804D050 @ =0x03002870
	movs r2, #8
	rsbs r2, r2, #0
	ldrb r0, [r4]
	ands r2, r0
	movs r5, #1
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	strb r2, [r4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #1
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #3
	bl SetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBgTilemapOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r4, #0
	str r4, [sp]
	ldr r1, _0804D054 @ =0x02022C60
	ldr r5, _0804D058 @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _0804D05C @ =0x02023460
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r6, _0804D060 @ =0x02023C60
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0804D064
	bl sub_0804D0B8
	b _0804D070
	.align 2, 0
_0804D050: .4byte 0x03002870
_0804D054: .4byte 0x02022C60
_0804D058: .4byte 0x01000200
_0804D05C: .4byte 0x02023460
_0804D060: .4byte 0x02023C60
_0804D064:
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
_0804D070:
	bl EfxPrepareScreenFx
	bl EnablePalSync
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	ldr r3, _0804D0B4 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D0B4: .4byte 0x03002870

	thumb_func_start sub_0804D0B8
sub_0804D0B8: @ 0x0804D0B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0804D0F8 @ =0x0201FAD0
	ldr r2, _0804D0FC @ =0x0203E028
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, _0804D100 @ =0x08FC0008
	adds r5, r0, r3
	movs r6, #2
	ldrsh r1, [r2, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldr r0, _0804D104 @ =0x0203E02C
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r8, r2
	adds r6, r0, #0
	cmp r1, #3
	bgt _0804D10C
	cmp r1, #1
	bge _0804D130
	cmp r1, #0
	beq _0804D114
	ldr r0, _0804D108 @ =0x020145C8
	b _0804D142
	.align 2, 0
_0804D0F8: .4byte 0x0201FAD0
_0804D0FC: .4byte 0x0203E028
_0804D100: .4byte 0x08FC0008
_0804D104: .4byte 0x0203E02C
_0804D108: .4byte 0x020145C8
_0804D10C:
	ldr r7, _0804D128 @ =0x020145C8
	mov ip, r7
	cmp r1, #4
	bne _0804D144
_0804D114:
	ldr r0, _0804D12C @ =0x0200003C
	ldr r1, _0804D128 @ =0x020145C8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	mov ip, r1
	b _0804D144
	.align 2, 0
_0804D128: .4byte 0x020145C8
_0804D12C: .4byte 0x0200003C
_0804D130:
	ldr r0, _0804D1B4 @ =0x0200003C
	ldr r1, _0804D1B8 @ =0x02014DC8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	ldr r0, _0804D1BC @ =0xFFFFF800
	adds r0, r0, r1
_0804D142:
	mov ip, r0
_0804D144:
	ldr r0, _0804D1C0 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	ldr r0, _0804D1C4 @ =0x0200004C
	ldr r1, [r5, #0x10]
	str r1, [r0]
	ldr r1, [r3, #0x10]
	str r1, [r0, #4]
	ldr r2, _0804D1C8 @ =0x02000044
	ldr r1, _0804D1CC @ =0x08B9B29C
	movs r3, #0
	ldrsh r0, [r6, r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r6, r7]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	mov r3, r8
	ldrh r0, [r3, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldrh r0, [r6]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r2, [r4, #0x1c]
	mov r6, ip
	str r6, [r4, #0x20]
	ldr r0, _0804D1D0 @ =0x0203E00E
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08054F30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D1B4: .4byte 0x0200003C
_0804D1B8: .4byte 0x02014DC8
_0804D1BC: .4byte 0xFFFFF800
_0804D1C0: .4byte 0x0202BBF8
_0804D1C4: .4byte 0x0200004C
_0804D1C8: .4byte 0x02000044
_0804D1CC: .4byte 0x08B9B29C
_0804D1D0: .4byte 0x0203E00E

	thumb_func_start EfxPrepareScreenFx
EfxPrepareScreenFx: @ 0x0804D1D4
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0804D214 @ =0x08194674
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0804D218 @ =0x02017648
	ldr r1, _0804D21C @ =0x06001400
	movs r2, #0xa0
	movs r3, #2
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, _0804D220 @ =0x081D88B4
	ldr r1, _0804D224 @ =0x06001000
	bl LZ77UnCompVram
	ldr r0, _0804D228 @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804D230
	ldr r5, _0804D22C @ =0x08B9A998
	b _0804D23E
	.align 2, 0
_0804D214: .4byte 0x08194674
_0804D218: .4byte 0x02017648
_0804D21C: .4byte 0x06001400
_0804D220: .4byte 0x081D88B4
_0804D224: .4byte 0x06001000
_0804D228: .4byte 0x0203E010
_0804D22C: .4byte 0x08B9A998
_0804D230:
	ldr r0, _0804D278 @ =0x0203E094
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r5, r0, #0
_0804D23E:
	ldr r4, _0804D27C @ =0x02017660
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804D280 @ =0x081D8ABC
	ldr r1, _0804D284 @ =0x06001400
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804D288 @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804D290
	ldr r5, _0804D28C @ =0x08B9A998
	b _0804D29E
	.align 2, 0
_0804D278: .4byte 0x0203E094
_0804D27C: .4byte 0x02017660
_0804D280: .4byte 0x081D8ABC
_0804D284: .4byte 0x06001400
_0804D288: .4byte 0x0203E010
_0804D28C: .4byte 0x08B9A998
_0804D290:
	ldr r0, _0804D2D8 @ =0x0203E094
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_0804D29E:
	ldr r4, _0804D2DC @ =0x02017670
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804D2E0 @ =0x081D8B0C
	ldr r1, _0804D2E4 @ =0x06001580
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804D2E8 @ =0x0203E010
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804D2F0
	ldr r5, _0804D2EC @ =0x08B9A998
	b _0804D2FE
	.align 2, 0
_0804D2D8: .4byte 0x0203E094
_0804D2DC: .4byte 0x02017670
_0804D2E0: .4byte 0x081D8B0C
_0804D2E4: .4byte 0x06001580
_0804D2E8: .4byte 0x0203E010
_0804D2EC: .4byte 0x08B9A998
_0804D2F0:
	ldr r0, _0804D338 @ =0x0203E098
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r5, r0, #0
_0804D2FE:
	ldr r4, _0804D33C @ =0x02017678
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804D340 @ =0x081D8B78
	ldr r1, _0804D344 @ =0x06001740
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, _0804D348 @ =0x0203E010
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804D350
	ldr r5, _0804D34C @ =0x08B9A998
	b _0804D35E
	.align 2, 0
_0804D338: .4byte 0x0203E098
_0804D33C: .4byte 0x02017678
_0804D340: .4byte 0x081D8B78
_0804D344: .4byte 0x06001740
_0804D348: .4byte 0x0203E010
_0804D34C: .4byte 0x08B9A998
_0804D350:
	ldr r0, _0804D414 @ =0x0203E098
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_0804D35E:
	ldr r4, _0804D418 @ =0x02017668
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, _0804D41C @ =0x081D8BC8
	ldr r1, _0804D420 @ =0x060018C0
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r4, _0804D424 @ =0x02022C60
	adds r0, r4, #0
	movs r1, #0x9f
	bl TmFill
	ldr r0, _0804D428 @ =0x081D8F50
	adds r6, r4, #0
	adds r6, #0x3c
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x14
	bl EfxTmCpyBG
	adds r4, #0x3e
	movs r5, #0x80
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #2
	bl sub_0806693C
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #3
	bl sub_0806693C
	movs r0, #1
	bl EnableBgSync
	ldr r6, _0804D42C @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _0804D430 @ =0x081D8FA0
	adds r0, r0, r5
	ldr r4, _0804D434 @ =0x020228A0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r1, _0804D438 @ =0x02000038
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D414: .4byte 0x0203E098
_0804D418: .4byte 0x02017668
_0804D41C: .4byte 0x081D8BC8
_0804D420: .4byte 0x060018C0
_0804D424: .4byte 0x02022C60
_0804D428: .4byte 0x081D8F50
_0804D42C: .4byte 0x0203E020
_0804D430: .4byte 0x081D8FA0
_0804D434: .4byte 0x020228A0
_0804D438: .4byte 0x02000038

	thumb_func_start GetBanimInitPosReal
GetBanimInitPosReal: @ 0x0804D43C
	push {r4, r5, lr}
	ldr r0, _0804D454 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804D47C
	lsls r0, r0, #2
	ldr r1, _0804D458 @ =_0804D45C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804D454: .4byte 0x0203E02C
_0804D458: .4byte _0804D45C
_0804D45C: @ jump table
	.4byte _0804D4C4 @ case 0
	.4byte _0804D470 @ case 1
	.4byte _0804D47C @ case 2
	.4byte _0804D4C4 @ case 3
	.4byte _0804D4C4 @ case 4
_0804D470:
	ldr r0, _0804D478 @ =0x0203E00C
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0804D4C6
	.align 2, 0
_0804D478: .4byte 0x0203E00C
_0804D47C:
	movs r1, #0
	movs r5, #0
	ldr r0, _0804D4AC @ =0x0203E008
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804D4A4
	ldr r4, _0804D4B0 @ =0x0203E09C
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
_0804D4A4:
	cmp r5, #1
	bne _0804D4B4
	movs r0, #0
	b _0804D4C6
	.align 2, 0
_0804D4AC: .4byte 0x0203E008
_0804D4B0: .4byte 0x0203E09C
_0804D4B4:
	cmp r1, #1
	beq _0804D4C4
	ldr r0, _0804D4C0 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0804D4C6
	.align 2, 0
_0804D4C0: .4byte 0x0203E00C
_0804D4C4:
	movs r0, #1
_0804D4C6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EkrEfxStatusClear
EkrEfxStatusClear: @ 0x0804D4CC
	ldr r1, _0804D528 @ =0x02017728
	movs r0, #0
	str r0, [r1]
	ldr r1, _0804D52C @ =0x0201772C
	str r0, [r1]
	ldr r1, _0804D530 @ =0x02017730
	str r0, [r1]
	ldr r1, _0804D534 @ =0x02017738
	str r0, [r1]
	ldr r1, _0804D538 @ =0x0201773C
	str r0, [r1]
	ldr r1, _0804D53C @ =0x02017740
	str r0, [r1]
	ldr r1, _0804D540 @ =0x02017748
	str r0, [r1]
	ldr r1, _0804D544 @ =0x0201774C
	str r0, [r1]
	ldr r1, _0804D548 @ =0x02017750
	str r0, [r1]
	ldr r1, _0804D54C @ =0x02017754
	str r0, [r1]
	ldr r1, _0804D550 @ =0x02017758
	str r0, [r1]
	ldr r1, _0804D554 @ =0x0201775C
	str r0, [r1]
	ldr r1, _0804D558 @ =0x02017760
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804D55C @ =0x02017764
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804D560 @ =0x02017768
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804D564 @ =0x02017780
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _0804D568 @ =0x0201776C
	str r0, [r1]
	str r0, [r1, #4]
	ldr r1, _0804D56C @ =0x02017778
	str r0, [r1]
	ldr r1, _0804D570 @ =0x0201777C
	str r0, [r1]
	bx lr
	.align 2, 0
_0804D528: .4byte 0x02017728
_0804D52C: .4byte 0x0201772C
_0804D530: .4byte 0x02017730
_0804D534: .4byte 0x02017738
_0804D538: .4byte 0x0201773C
_0804D53C: .4byte 0x02017740
_0804D540: .4byte 0x02017748
_0804D544: .4byte 0x0201774C
_0804D548: .4byte 0x02017750
_0804D54C: .4byte 0x02017754
_0804D550: .4byte 0x02017758
_0804D554: .4byte 0x0201775C
_0804D558: .4byte 0x02017760
_0804D55C: .4byte 0x02017764
_0804D560: .4byte 0x02017768
_0804D564: .4byte 0x02017780
_0804D568: .4byte 0x0201776C
_0804D56C: .4byte 0x02017778
_0804D570: .4byte 0x0201777C

	thumb_func_start CheckEkrHitDone
CheckEkrHitDone: @ 0x0804D574
	ldr r0, _0804D588 @ =0x02017728
	ldr r0, [r0]
	cmp r0, #0
	bne _0804D590
	ldr r0, _0804D58C @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804D590
	movs r0, #1
	b _0804D592
	.align 2, 0
_0804D588: .4byte 0x02017728
_0804D58C: .4byte 0x0201772C
_0804D590:
	movs r0, #0
_0804D592:
	bx lr

	thumb_func_start EkrEfxIsUnitHittedNow
EkrEfxIsUnitHittedNow: @ 0x0804D594
	ldr r1, _0804D5A0 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804D5A0: .4byte 0x02017780

	thumb_func_start NewEfxHPBar
NewEfxHPBar: @ 0x0804D5A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0804D5D4 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _0804D664
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804D5D8 @ =0x08B9ABC4
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804D5E0
	ldr r0, _0804D5DC @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0804D5E8
	.align 2, 0
_0804D5D4: .4byte 0x02017728
_0804D5D8: .4byte 0x08B9ABC4
_0804D5DC: .4byte 0x02000000
_0804D5E0:
	ldr r0, _0804D63C @ =0x02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0804D5E8:
	str r0, [r6, #0x60]
	ldr r4, _0804D640 @ =0x0203E05E
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _0804D644
	movs r0, #1
	rsbs r0, r0, #0
	b _0804D646
	.align 2, 0
_0804D63C: .4byte 0x02000000
_0804D640: .4byte 0x0203E05E
_0804D644:
	movs r0, #1
_0804D646:
	str r0, [r6, #0x48]
	movs r1, #0
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D66C @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_0804D664:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D66C: .4byte 0x02017780

	thumb_func_start sub_0804D670
sub_0804D670: @ 0x0804D670
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _0804D714 @ =0x02000000
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804D6D2
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0804D6D2
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D718 @ =0x0203E0B8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804D6D2
	movs r0, #1
	str r0, [r5, #0x58]
_0804D6D2:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804D774
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804D774
	ldr r4, _0804D71C @ =0x0203E05E
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D720 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _0804D768
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0804D724
	movs r0, #0
	b _0804D738
	.align 2, 0
_0804D714: .4byte 0x02000000
_0804D718: .4byte 0x0203E0B8
_0804D71C: .4byte 0x0203E05E
_0804D720: .4byte 0x02017780
_0804D724:
	ldr r4, _0804D748 @ =0x0203E09C
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl CheckBattleDefeatTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0804D738:
	cmp r0, #1
	bne _0804D74C
	adds r0, r6, #0
	adds r1, r7, #0
	bl NewEfxDeadEvent
	b _0804D768
	.align 2, 0
_0804D748: .4byte 0x0203E09C
_0804D74C:
	bl PlayDeathSoundForArena
	adds r0, r6, #0
	adds r1, r7, #0
	bl NewEfxDead
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D770 @ =0x0203E010
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_0804D768:
	adds r0, r5, #0
	bl Proc_Break
	b _0804D780
	.align 2, 0
_0804D770: .4byte 0x0203E010
_0804D774:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804D780
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804D780:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxHpBar_MoveCameraOnEnd
EfxHpBar_MoveCameraOnEnd: @ 0x0804D788
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804D7D0 @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804D820
	ldr r0, _0804D7D4 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804D820
	strh r0, [r5, #0x2c]
	movs r0, #1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x64]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRound2
	cmp r0, #1
	bne _0804D81A
	ldr r0, _0804D7D8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804D81A
	lsls r0, r0, #2
	ldr r1, _0804D7DC @ =_0804D7E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804D7D0: .4byte 0x0201774C
_0804D7D4: .4byte 0x0201772C
_0804D7D8: .4byte 0x0203E02C
_0804D7DC: .4byte _0804D7E0
_0804D7E0: @ jump table
	.4byte _0804D7F4 @ case 0
	.4byte _0804D7F4 @ case 1
	.4byte _0804D808 @ case 2
	.4byte _0804D7F4 @ case 3
	.4byte _0804D7F4 @ case 4
_0804D7F4:
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	b _0804D81A
_0804D808:
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0804D81A:
	adds r0, r5, #0
	bl Proc_Break
_0804D820:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxHpBar_WaitCameraMove
EfxHpBar_WaitCameraMove: @ 0x0804D828
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	subs r0, #4
	cmp r1, r0
	bne _0804D84E
	ldr r0, [r2, #0x64]
	bl GetAnimAnotherSide
	movs r0, #4
	bl EnableBgSync
	b _0804D864
_0804D84E:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _0804D864
	ldr r1, _0804D868 @ =0x02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0804D864:
	pop {r0}
	bx r0
	.align 2, 0
_0804D868: .4byte 0x02017728

	thumb_func_start NewEfxHpBarResire
NewEfxHpBarResire: @ 0x0804D86C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0804D8A4 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _0804D93E
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804D8A8 @ =0x08B9ABEC
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804D8B0
	ldr r0, _0804D8AC @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0804D8B8
	.align 2, 0
_0804D8A4: .4byte 0x02017728
_0804D8A8: .4byte 0x08B9ABEC
_0804D8AC: .4byte 0x02000000
_0804D8B0:
	ldr r0, _0804D90C @ =0x02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0804D8B8:
	str r0, [r6, #0x60]
	ldr r4, _0804D910 @ =0x0203E05E
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _0804D914
	movs r0, #1
	rsbs r0, r0, #0
	b _0804D916
	.align 2, 0
_0804D90C: .4byte 0x02000000
_0804D910: .4byte 0x0203E05E
_0804D914:
	movs r0, #1
_0804D916:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, _0804D944 @ =0x02017750
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D948 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_0804D93E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D944: .4byte 0x02017750
_0804D948: .4byte 0x02017780

	thumb_func_start sub_0804D94C
sub_0804D94C: @ 0x0804D94C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804D99C
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0804D99C
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D9E8 @ =0x0203E0B8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804D99C
	movs r0, #1
	str r0, [r5, #0x58]
_0804D99C:
	ldr r0, [r5, #0x54]
	cmp r0, #0x54
	bne _0804D9F8
	ldr r6, [r5, #0x58]
	cmp r6, #1
	bne _0804D9F8
	ldr r4, _0804D9EC @ =0x0203E05E
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D9F0 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _0804D9D6
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
_0804D9D6:
	strh r4, [r5, #0x2c]
	movs r0, #0xa
	strh r0, [r5, #0x2e]
	ldr r0, _0804D9F4 @ =0x02017750
	str r6, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b _0804DA04
	.align 2, 0
_0804D9E8: .4byte 0x0203E0B8
_0804D9EC: .4byte 0x0203E05E
_0804D9F0: .4byte 0x02017780
_0804D9F4: .4byte 0x02017750
_0804D9F8:
	adds r0, #1
	str r0, [r5, #0x54]
	cmp r0, #0x53
	bls _0804DA04
	movs r0, #0x54
	str r0, [r5, #0x54]
_0804DA04:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804DA0C
sub_0804DA0C: @ 0x0804DA0C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804DAA6
	ldr r4, _0804DA88 @ =0x0203E05E
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	strh r7, [r6, #0x2c]
	ldr r1, [r6, #0x4c]
	strh r1, [r6, #0x2e]
	str r7, [r6, #0x54]
	str r7, [r6, #0x58]
	cmp r1, r0
	bne _0804DA78
	movs r0, #1
	str r0, [r6, #0x58]
_0804DA78:
	ldr r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble _0804DA8C
	movs r0, #1
	rsbs r0, r0, #0
	b _0804DA8E
	.align 2, 0
_0804DA88: .4byte 0x0203E05E
_0804DA8C:
	movs r0, #1
_0804DA8E:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804DAAC @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_0804DAA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DAAC: .4byte 0x02017780

	thumb_func_start sub_0804DAB0
sub_0804DAB0: @ 0x0804DAB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, _0804DB88 @ =0x02000000
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	mov r8, r0
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804DB42
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0804DB42
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804DB8C @ =0x0203E0B8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	ldr r4, _0804DB90 @ =0x00000395
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r7, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804DB42
	movs r0, #1
	str r0, [r5, #0x58]
_0804DB42:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804DBEC
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804DBEC
	ldr r4, _0804DB94 @ =0x0203E05E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804DB98 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DBE0
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0804DB9C
	movs r0, #0
	b _0804DBB0
	.align 2, 0
_0804DB88: .4byte 0x02000000
_0804DB8C: .4byte 0x0203E0B8
_0804DB90: .4byte 0x00000395
_0804DB94: .4byte 0x0203E05E
_0804DB98: .4byte 0x02017780
_0804DB9C:
	ldr r4, _0804DBC0 @ =0x0203E09C
	adds r0, r6, #0
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl CheckBattleDefeatTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0804DBB0:
	cmp r0, #1
	bne _0804DBC4
	adds r0, r6, #0
	mov r1, r8
	bl NewEfxDeadEvent
	b _0804DBE0
	.align 2, 0
_0804DBC0: .4byte 0x0203E09C
_0804DBC4:
	bl PlayDeathSoundForArena
	adds r0, r6, #0
	mov r1, r8
	bl NewEfxDead
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804DBE8 @ =0x0203E010
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_0804DBE0:
	adds r0, r5, #0
	bl Proc_Break
	b _0804DBF8
	.align 2, 0
_0804DBE8: .4byte 0x0203E010
_0804DBEC:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804DBF8
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804DBF8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxAvoid
NewEfxAvoid: @ 0x0804DC04
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0804DC34 @ =0x02017728
	ldr r5, [r1]
	cmp r5, #0
	bne _0804DC72
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804DC38 @ =0x08B9AC24
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804DC40
	ldr r0, _0804DC3C @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	b _0804DC48
	.align 2, 0
_0804DC34: .4byte 0x02017728
_0804DC38: .4byte 0x08B9AC24
_0804DC3C: .4byte 0x02000000
_0804DC40:
	ldr r0, _0804DC78 @ =0x02000000
	ldr r1, [r0]
	str r1, [r4, #0x5c]
	ldr r0, [r0, #8]
_0804DC48:
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl NewEfxDamageMojiEffect
	str r6, [r4, #0x64]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd7
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd7
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_0804DC72:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC78: .4byte 0x02000000

	thumb_func_start EfxAvoidMain
EfxAvoidMain: @ 0x0804DC7C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _0804DC94
	adds r0, r1, #0
	bl Proc_Break
_0804DC94:
	pop {r0}
	bx r0

	thumb_func_start NewEfxHpBarLive
NewEfxHpBarLive: @ 0x0804DC98
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, _0804DCC8 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _0804DD64
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804DCCC @ =0x08B9AC4C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804DCD4
	ldr r0, _0804DCD0 @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0804DCDC
	.align 2, 0
_0804DCC8: .4byte 0x02017728
_0804DCCC: .4byte 0x08B9AC4C
_0804DCD0: .4byte 0x02000000
_0804DCD4:
	ldr r0, _0804DD34 @ =0x02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0804DCDC:
	str r0, [r6, #0x60]
	ldr r4, _0804DD38 @ =0x0203E05E
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	str r1, [r6, #0x50]
	movs r0, #0
	str r0, [r6, #0x54]
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x4c]
	cmp r0, r1
	bne _0804DD3C
	movs r0, #1
	str r0, [r6, #0x58]
	b _0804DD4A
	.align 2, 0
_0804DD34: .4byte 0x02000000
_0804DD38: .4byte 0x0203E05E
_0804DD3C:
	cmp r0, r1
	ble _0804DD46
	movs r0, #1
	rsbs r0, r0, #0
	b _0804DD48
_0804DD46:
	movs r0, #1
_0804DD48:
	str r0, [r6, #0x48]
_0804DD4A:
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r7, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804DD6C @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_0804DD64:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DD6C: .4byte 0x02017780

	thumb_func_start sub_0804DD70
sub_0804DD70: @ 0x0804DD70
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804DDCE
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0804DDCE
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _0804DE04 @ =0x0203E0B8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	ldr r4, _0804DE08 @ =0x00000395
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804DDCE
	movs r0, #1
	str r0, [r5, #0x58]
_0804DDCE:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804DE14
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804DE14
	ldr r4, _0804DE0C @ =0x0203E05E
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _0804DE10 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b _0804DE20
	.align 2, 0
_0804DE04: .4byte 0x0203E0B8
_0804DE08: .4byte 0x00000395
_0804DE0C: .4byte 0x0203E05E
_0804DE10: .4byte 0x02017780
_0804DE14:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804DE20
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804DE20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxNoDmage
NewEfxNoDmage: @ 0x0804DE28
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0804DE74 @ =0x02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0804DE78 @ =0x08B9AC74
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	str r5, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxDamageMojiEffect
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804DED0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DE74: .4byte 0x02017728
_0804DE78: .4byte 0x08B9AC74

	thumb_func_start sub_0804DE7C
sub_0804DE7C: @ 0x0804DE7C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	cmp r0, #8
	bne _0804DEC4
	ldr r6, _0804DECC @ =0x0203E05E
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DEBE
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
_0804DEBE:
	adds r0, r4, #0
	bl Proc_Break
_0804DEC4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DECC: .4byte 0x0203E05E

	thumb_func_start sub_0804DED0
sub_0804DED0: @ 0x0804DED0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804DEF0 @ =0x08B9AC9C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804DEF0: .4byte 0x08B9AC9C

	thumb_func_start sub_0804DEF4
sub_0804DEF4: @ 0x0804DEF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	mov r8, r0
	ldr r1, [r7, #0x60]
	mov sb, r1
	ldr r4, _0804DF50 @ =0x081D7EE4
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0804DF5C
	mov r0, r8
	bl GetAnimPosition
	ldr r5, _0804DF54 @ =0x02000028
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r4, _0804DF58 @ =0x0201FB00
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	mov r2, r8
	strh r0, [r2, #2]
	ldr r0, [r7, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	ldrh r4, [r4]
	subs r0, r0, r4
	mov r1, sb
	strh r0, [r1, #2]
	adds r0, r7, #0
	bl Proc_Break
	b _0804DFBC
	.align 2, 0
_0804DF50: .4byte 0x081D7EE4
_0804DF54: .4byte 0x02000028
_0804DF58: .4byte 0x0201FB00
_0804DF5C:
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #1
	bne _0804DF78
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0804DF82
_0804DF78:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r4, [r0]
_0804DF82:
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	ldr r6, _0804DFC8 @ =0x02000028
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r5, _0804DFCC @ =0x0201FB00
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r1, r0, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, r1
	mov r2, r8
	strh r1, [r2, #2]
	ldr r0, [r7, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r1, r0, r1
	adds r4, r4, r1
	mov r0, sb
	strh r4, [r0, #2]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
_0804DFBC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DFC8: .4byte 0x02000028
_0804DFCC: .4byte 0x0201FB00

	thumb_func_start NewEfxStatusCHG
NewEfxStatusCHG: @ 0x0804DFD0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0804DFF4 @ =0x02017728
	ldr r4, [r1]
	cmp r4, #0
	bne _0804DFEC
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804DFF8 @ =0x08B9ACB4
	movs r1, #3
	bl SpawnProc
	strh r4, [r0, #0x2c]
	str r5, [r0, #0x64]
_0804DFEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804DFF4: .4byte 0x02017728
_0804DFF8: .4byte 0x08B9ACB4

	thumb_func_start EfxStatusCHGMain
EfxStatusCHGMain: @ 0x0804DFFC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0804E014
	adds r0, r1, #0
	bl Proc_Break
_0804E014:
	pop {r0}
	bx r0

	thumb_func_start NewEfxDeadEvent
NewEfxDeadEvent: @ 0x0804E018
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E038 @ =0x08B9ACE4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	ldr r1, _0804E03C @ =0x02017738
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E038: .4byte 0x08B9ACE4
_0804E03C: .4byte 0x02017738

	thumb_func_start sub_0804E040
sub_0804E040: @ 0x0804E040
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0804E0AC @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E072
	ldr r0, _0804E0B0 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E072
	ldr r4, _0804E0B4 @ =0x0201FAF8
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #1
	bne _0804E072
	movs r6, #1
_0804E072:
	cmp r6, #1
	bne _0804E0A6
	movs r0, #7
	strh r0, [r5, #0x2c]
	ldr r0, _0804E0B8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0804E0A0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E0BC @ =0x02017744
	ldr r1, [r1]
	cmp r0, r1
	beq _0804E0A0
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl NewEfxFarAttackWithDistance
	movs r0, #0
	strh r0, [r5, #0x2c]
_0804E0A0:
	adds r0, r5, #0
	bl Proc_Break
_0804E0A6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E0AC: .4byte 0x0201774C
_0804E0B0: .4byte 0x0201772C
_0804E0B4: .4byte 0x0201FAF8
_0804E0B8: .4byte 0x0203E02C
_0804E0BC: .4byte 0x02017744

	thumb_func_start sub_0804E0C0
sub_0804E0C0: @ 0x0804E0C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0804E0EA
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	adds r0, r4, #0
	bl Proc_Break
_0804E0EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804E0F0
sub_0804E0F0: @ 0x0804E0F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804E14E
	bl EnableEkrGauge
	bl AsyncEkrDispUP
	movs r0, #0
	str r0, [sp]
	ldr r1, _0804E158 @ =0x02022C60
	ldr r2, _0804E15C @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0804E160 @ =0x02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_0804CC38
	ldr r4, _0804E164 @ =0x0203E09C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	adds r0, r0, r4
	ldrb r0, [r0]
	bl DisplayDefeatTalkForPid
	adds r0, r5, #0
	bl Proc_Break
_0804E14E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E158: .4byte 0x02022C60
_0804E15C: .4byte 0x01000200
_0804E160: .4byte 0x02000038
_0804E164: .4byte 0x0203E09C

	thumb_func_start sub_0804E168
sub_0804E168: @ 0x0804E168
	push {r4, r5, lr}
	adds r4, r0, #0
	bl IsEventRunning
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _0804E1C0
	bl PlayDeathSoundForArena
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl NewEfxDead
	bl EfxPrepareScreenFx
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E1C8 @ =0x0203E010
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl DisableEkrGauge
	bl UnAsyncEkrDispUP
	bl EkrGauge_0804CC28
	adds r0, r4, #0
	bl Proc_Break
_0804E1C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E1C8: .4byte 0x0203E010

	thumb_func_start sub_0804E1CC
sub_0804E1CC: @ 0x0804E1CC
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804E1E8
	ldr r1, _0804E1F0 @ =0x02017738
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804E1E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E1F0: .4byte 0x02017738

	thumb_func_start NewEfxDead
NewEfxDead: @ 0x0804E1F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0804E228 @ =0x02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _0804E22C @ =0x02017734
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804E230 @ =0x08B9AD1C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl DisableEfxStatusUnits
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E228: .4byte 0x02017728
_0804E22C: .4byte 0x02017734
_0804E230: .4byte 0x08B9AD1C

	thumb_func_start sub_0804E234
sub_0804E234: @ 0x0804E234
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804E258 @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E272
	ldr r0, _0804E25C @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E272
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804E260
	ldr r0, [r4, #0x5c]
	bl SetEfxDragonDeadFallHead
	b _0804E268
	.align 2, 0
_0804E258: .4byte 0x0201774C
_0804E25C: .4byte 0x0201772C
_0804E260:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804E2E8
_0804E268:
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0804E272:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804E278
sub_0804E278: @ 0x0804E278
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne _0804E2BE
	adds r0, r5, #0
	bl CheckEfxDragonDeadFallHead
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804E2DA
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804E36C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xd6
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b _0804E2DA
_0804E2BE:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0804E2DA
	ldr r1, _0804E2E0 @ =0x02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _0804E2E4 @ =0x02017734
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804E2DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E2E0: .4byte 0x02017728
_0804E2E4: .4byte 0x02017734

	thumb_func_start sub_0804E2E8
sub_0804E2E8: @ 0x0804E2E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E308 @ =0x08B9AD3C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E308: .4byte 0x08B9AD3C

	thumb_func_start sub_0804E30C
sub_0804E30C: @ 0x0804E30C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x5c]
	ldr r4, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _0804E344
	ldr r1, _0804E340 @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r5, [r3]
	ands r0, r5
	strh r0, [r3]
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldrh r0, [r2, #0x2e]
	adds r0, #1
	strh r0, [r2, #0x2e]
	b _0804E352
	.align 2, 0
_0804E340: .4byte 0x0000FFFD
_0804E344:
	movs r0, #2
	ldrh r1, [r3]
	orrs r1, r0
	strh r1, [r3]
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
_0804E352:
	movs r5, #0x2e
	ldrsh r0, [r2, r5]
	cmp r0, #5
	ble _0804E366
	movs r0, #0
	strh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
	adds r0, r2, #0
	bl Proc_Break
_0804E366:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0804E36C
sub_0804E36C: @ 0x0804E36C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E3D4 @ =0x08B9AD54
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r4, #0xa]
	strh r0, [r5, #0xa]
	bl AnimSort
	ldr r2, _0804E3D8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0804E3DC @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _0804E3E0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E3D4: .4byte 0x08B9AD54
_0804E3D8: .4byte 0x03002870
_0804E3DC: .4byte 0x0000FFE0
_0804E3E0: .4byte 0x0000E0FF

	thumb_func_start sub_0804E3E4
sub_0804E3E4: @ 0x0804E3E4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	orrs r0, r1
	str r0, [r3, #0x1c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _0804E458
	movs r0, #2
	ldrh r1, [r2]
	orrs r1, r0
	strh r1, [r2]
	ldrh r1, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0804E450 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	ands r0, r1
	str r0, [r3, #0x1c]
	ldr r2, _0804E454 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, r4, #0
	bl Proc_Break
	b _0804E48A
	.align 2, 0
_0804E450: .4byte 0xFFFFFBFF
_0804E454: .4byte 0x03002870
_0804E458:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r3, _0804E494 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
_0804E48A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E494: .4byte 0x03002870

	thumb_func_start NewEfxFarAttackWithDistance
NewEfxFarAttackWithDistance: @ 0x0804E498
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _0804E4B4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0804E564
	lsls r0, r0, #2
	ldr r1, _0804E4B8 @ =_0804E4BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E4B4: .4byte 0x0203E02C
_0804E4B8: .4byte _0804E4BC
_0804E4BC: @ jump table
	.4byte _0804E564 @ case 0
	.4byte _0804E4D0 @ case 1
	.4byte _0804E4D0 @ case 2
	.4byte _0804E564 @ case 3
	.4byte _0804E564 @ case 4
_0804E4D0:
	ldr r0, _0804E504 @ =0x08B9AD6C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAnimPosition
	adds r2, r4, #0
	adds r2, #0x29
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #0x2c]
	lsls r1, r6, #0x10
	asrs r2, r1, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0804E50C
	asrs r0, r1, #0x11
	strh r0, [r4, #0x2e]
	subs r0, r2, r0
	strh r0, [r4, #0x30]
	ldr r2, _0804E508 @ =0x0203E02C
	b _0804E526
	.align 2, 0
_0804E504: .4byte 0x08B9AD6C
_0804E508: .4byte 0x0203E02C
_0804E50C:
	ldr r0, _0804E51C @ =0x0203E02C
	adds r2, r0, #0
	ldrh r0, [r2]
	cmp r0, #1
	bne _0804E520
	movs r0, #5
	b _0804E522
	.align 2, 0
_0804E51C: .4byte 0x0203E02C
_0804E520:
	movs r0, #7
_0804E522:
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_0804E526:
	movs r1, #0xf0
	ldrh r2, [r2]
	cmp r2, #1
	bne _0804E530
	movs r1, #0x20
_0804E530:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #0
	bne _0804E548
	rsbs r0, r1, #0
	strh r0, [r4, #0x32]
	lsrs r0, r0, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	b _0804E556
_0804E548:
	movs r0, #0
	strh r0, [r4, #0x32]
	rsbs r1, r1, #0
	lsrs r0, r1, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
_0804E556:
	ldr r1, _0804E56C @ =0x0201FB00
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	str r0, [r1]
	ldr r1, _0804E570 @ =0x02017748
	movs r0, #1
	str r0, [r1]
_0804E564:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E56C: .4byte 0x0201FB00
_0804E570: .4byte 0x02017748

	thumb_func_start sub_0804E574
sub_0804E574: @ 0x0804E574
	push {r4, r5, lr}
	ldr r3, _0804E5A4 @ =0x02000000
	ldr r4, [r3]
	rsbs r1, r1, #0
	ldr r2, _0804E5A8 @ =0x02000028
	ldrh r5, [r2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #4]
	ldrh r5, [r2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #8]
	ldrh r5, [r2, #2]
	adds r0, r5, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #0xc]
	ldrh r2, [r2, #2]
	adds r1, r2, r1
	strh r1, [r4, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E5A4: .4byte 0x02000000
_0804E5A8: .4byte 0x02000028

	thumb_func_start sub_0804E5AC
sub_0804E5AC: @ 0x0804E5AC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl sub_0804E574
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl EkrDragonTmCpyExt
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl sub_0804E6DC
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0804E5DC
sub_0804E5DC: @ 0x0804E5DC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _0804E644 @ =0x0201FB00
	str r1, [r5]
	adds r0, r4, #0
	bl sub_0804E574
	ldr r0, [r5]
	movs r1, #0
	bl EkrDragonTmCpyExt
	ldr r0, [r5]
	bl sub_0804E6DC
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804E622
	ldr r0, [r5]
	bl sub_080554FC
_0804E622:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804E63C
	movs r0, #1
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0804E63C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E644: .4byte 0x0201FB00

	thumb_func_start sub_0804E648
sub_0804E648: @ 0x0804E648
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r5, #0x38
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _0804E6B0 @ =0x0201FB00
	str r1, [r5]
	adds r0, r4, #0
	bl sub_0804E574
	ldr r0, [r5]
	movs r1, #0
	bl EkrDragonTmCpyExt
	ldr r0, [r5]
	bl sub_0804E6DC
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804E68E
	ldr r0, [r5]
	bl sub_080554FC
_0804E68E:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804E6CA
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804E6B8
	ldr r1, _0804E6B4 @ =0x02017744
	movs r0, #1
	b _0804E6BC
	.align 2, 0
_0804E6B0: .4byte 0x0201FB00
_0804E6B4: .4byte 0x02017744
_0804E6B8:
	ldr r1, _0804E6D4 @ =0x02017744
	movs r0, #0
_0804E6BC:
	str r0, [r1]
	ldr r1, _0804E6D8 @ =0x02017748
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804E6CA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E6D4: .4byte 0x02017744
_0804E6D8: .4byte 0x02017748

	thumb_func_start sub_0804E6DC
sub_0804E6DC: @ 0x0804E6DC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl CheckInEkrDragon
	cmp r0, #0
	bne _0804E72C
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0804E72C
	asrs r4, r5, #3
	movs r1, #7
	ands r1, r5
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, _0804E734 @ =0x0201C906
	adds r4, r4, r0
	movs r0, #0x84
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, _0804E738 @ =0x02023C60
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	subs r0, #0x15
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl EnableBgSync
_0804E72C:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E734: .4byte 0x0201C906
_0804E738: .4byte 0x02023C60

	thumb_func_start NewEfxQuakePure
NewEfxQuakePure: @ 0x0804E73C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E774 @ =0x08B9AD94
	movs r1, #3
	bl SpawnProc
	ldr r2, _0804E778 @ =0x08B9ADAC
	lsls r1, r4, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x44]
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r2
	ldr r1, [r4]
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	strb r1, [r3]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804E774: .4byte 0x08B9AD94
_0804E778: .4byte 0x08B9ADAC

	thumb_func_start sub_0804E77C
sub_0804E77C: @ 0x0804E77C
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r4, [r0]
	ldr r1, _0804E7AC @ =0x00007FFF
	cmp r4, r1
	beq _0804E7B4
	ldr r1, _0804E7B0 @ =0x02017760
	strh r4, [r1]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	b _0804E7E0
	.align 2, 0
_0804E7AC: .4byte 0x00007FFF
_0804E7B0: .4byte 0x02017760
_0804E7B4:
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804E7C4
	cmp r0, #1
	beq _0804E7D8
	b _0804E7E0
_0804E7C4:
	strh r0, [r2, #0x2c]
	ldr r0, _0804E7D4 @ =0x02017760
	ldrh r1, [r3]
	strh r1, [r0]
	ldrh r1, [r3, #2]
	strh r1, [r0, #2]
	b _0804E7E0
	.align 2, 0
_0804E7D4: .4byte 0x02017760
_0804E7D8:
	ldr r1, _0804E7E8 @ =0x02017760
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
_0804E7E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E7E8: .4byte 0x02017760

	thumb_func_start NewEfxHitQuakePure
NewEfxHitQuakePure: @ 0x0804E7EC
	push {lr}
	ldr r0, _0804E7FC @ =0x08B9AE04
	movs r1, #3
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_0804E7FC: .4byte 0x08B9AE04

	thumb_func_start sub_0804E800
sub_0804E800: @ 0x0804E800
	bx lr
	.align 2, 0

	thumb_func_start NewEfxQuake
NewEfxQuake: @ 0x0804E804
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804E814 @ =0x02017748
	ldr r0, [r0]
	cmp r0, #1
	bne _0804E818
	movs r0, #0
	b _0804E8F4
	.align 2, 0
_0804E814: .4byte 0x02017748
_0804E818:
	ldr r1, _0804E844 @ =0x0201773C
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804E848 @ =0x08B9AE1C
	movs r1, #3
	bl SpawnProc
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r1, _0804E84C @ =0x02000000
	ldr r0, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1, #8]
	str r0, [r2, #0x60]
	cmp r4, #6
	bhi _0804E8E0
	lsls r0, r4, #2
	ldr r1, _0804E850 @ =_0804E854
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E844: .4byte 0x0201773C
_0804E848: .4byte 0x08B9AE1C
_0804E84C: .4byte 0x02000000
_0804E850: .4byte _0804E854
_0804E854: @ jump table
	.4byte _0804E870 @ case 0
	.4byte _0804E880 @ case 1
	.4byte _0804E890 @ case 2
	.4byte _0804E8A0 @ case 3
	.4byte _0804E8B0 @ case 4
	.4byte _0804E8C0 @ case 5
	.4byte _0804E8D0 @ case 6
_0804E870:
	ldr r0, _0804E87C @ =0x081D7F00
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E87C: .4byte 0x081D7F00
_0804E880:
	ldr r0, _0804E88C @ =0x081D7F22
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E88C: .4byte 0x081D7F22
_0804E890:
	ldr r0, _0804E89C @ =0x081D7F6C
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E89C: .4byte 0x081D7F6C
_0804E8A0:
	ldr r0, _0804E8AC @ =0x081D7FB6
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E8AC: .4byte 0x081D7FB6
_0804E8B0:
	ldr r0, _0804E8BC @ =0x081D8000
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _0804E8EA
	.align 2, 0
_0804E8BC: .4byte 0x081D8000
_0804E8C0:
	ldr r0, _0804E8CC @ =0x081D804A
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _0804E8EA
	.align 2, 0
_0804E8CC: .4byte 0x081D804A
_0804E8D0:
	ldr r0, _0804E8DC @ =0x081D80B4
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _0804E8EA
	.align 2, 0
_0804E8DC: .4byte 0x081D80B4
_0804E8E0:
	ldr r0, _0804E8FC @ =0x081D7F00
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
_0804E8EA:
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x3c]
	adds r0, r2, #0
_0804E8F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804E8FC: .4byte 0x081D7F00

	thumb_func_start sub_0804E900
sub_0804E900: @ 0x0804E900
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, [r6, #0x44]
	ldrh r4, [r6, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r2, [r0]
	ldr r1, _0804E978 @ =0x00007FFF
	cmp r2, r1
	bne _0804E98C
	ldr r3, _0804E97C @ =0x02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _0804E980 @ =0x0201FB00
	ldr r1, [r0]
	subs r7, r2, r1
	ldr r2, _0804E984 @ =0x0200002C
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl SetEkrFrontAnimPostion
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804E96A
	ldrh r1, [r6, #0x34]
	ldrh r2, [r6, #0x3c]
	movs r0, #3
	bl SetBgOffset
_0804E96A:
	ldr r1, _0804E988 @ =0x0201773C
	movs r0, #0
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_End
	b _0804EA9E
	.align 2, 0
_0804E978: .4byte 0x00007FFF
_0804E97C: .4byte 0x02000028
_0804E980: .4byte 0x0201FB00
_0804E984: .4byte 0x0200002C
_0804E988: .4byte 0x0201773C
_0804E98C:
	ldr r5, _0804E9E4 @ =0x02017760
	strh r2, [r5]
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r5, #2]
	adds r0, r4, #1
	strh r0, [r6, #0x2c]
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804E9CC
	ldrh r2, [r6, #0x34]
	ldrh r3, [r5]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r4, [r6, #0x3c]
	ldrh r0, [r5, #2]
	adds r2, r4, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
_0804E9CC:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804E9EC
	ldr r4, _0804E9E8 @ =0x02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	b _0804E9F8
	.align 2, 0
_0804E9E4: .4byte 0x02017760
_0804E9E8: .4byte 0x02000028
_0804E9EC:
	ldr r4, _0804EA58 @ =0x02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
_0804E9F8:
	ldr r3, _0804EA5C @ =0x0201FB00
	ldr r0, [r3]
	subs r7, r1, r0
	ldr r2, _0804EA60 @ =0x0200002C
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r5, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _0804EA64 @ =0x02017760
	movs r4, #0
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	ldr r0, [r3]
	subs r4, r1, r0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _0804EA68 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804EA6C
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	b _0804EA9E
	.align 2, 0
_0804EA58: .4byte 0x02000028
_0804EA5C: .4byte 0x0201FB00
_0804EA60: .4byte 0x0200002C
_0804EA64: .4byte 0x02017760
_0804EA68: .4byte 0x0203E02C
_0804EA6C:
	cmp r0, #0
	blt _0804EA9E
	cmp r0, #2
	bgt _0804EA9E
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804EA90
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	b _0804EA9E
_0804EA90:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
_0804EA9E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewEfxHitQuake
NewEfxHitQuake: @ 0x0804EAA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r6, r2, #0
	ldr r0, _0804EAEC @ =0x02017740
	ldr r7, [r0]
	cmp r7, #0
	beq _0804EAC0
	b _0804EC5A
_0804EAC0:
	movs r4, #1
	str r4, [r0]
	ldr r0, _0804EAF0 @ =0x08B9AE34
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	mov r1, sb
	str r1, [r5, #0x60]
	strh r7, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r6, #0
	beq _0804EB28
	cmp r6, #1
	bne _0804EAF8
	ldr r0, _0804EAF4 @ =0x081D7F22
	b _0804EB2A
	.align 2, 0
_0804EAEC: .4byte 0x02017740
_0804EAF0: .4byte 0x08B9AE34
_0804EAF4: .4byte 0x081D7F22
_0804EAF8:
	cmp r6, #2
	bne _0804EB04
	ldr r0, _0804EB00 @ =0x081D7F6C
	b _0804EB2A
	.align 2, 0
_0804EB00: .4byte 0x081D7F6C
_0804EB04:
	cmp r6, #3
	bne _0804EB10
	ldr r0, _0804EB0C @ =0x081D7FB6
	b _0804EB2A
	.align 2, 0
_0804EB0C: .4byte 0x081D7FB6
_0804EB10:
	cmp r6, #4
	bne _0804EB1C
	ldr r0, _0804EB18 @ =0x081D81D0
	b _0804EB2A
	.align 2, 0
_0804EB18: .4byte 0x081D81D0
_0804EB1C:
	cmp r6, #5
	bne _0804EB28
	ldr r0, _0804EB24 @ =0x081D8266
	b _0804EB2A
	.align 2, 0
_0804EB24: .4byte 0x081D8266
_0804EB28:
	ldr r0, _0804EB40 @ =0x081D7F00
_0804EB2A:
	str r0, [r5, #0x44]
	movs r0, #1
	str r0, [r5, #0x48]
	bl CheckInEkrDragon
	adds r4, r0, #0
	cmp r4, #0
	beq _0804EB44
	movs r0, #0
	str r0, [r5, #0x64]
	b _0804EC5A
	.align 2, 0
_0804EB40: .4byte 0x081D7F00
_0804EB44:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804EB50
	str r4, [r5, #0x64]
	b _0804EC5A
_0804EB50:
	ldr r0, _0804EB60 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804EB64
	str r0, [r5, #0x64]
	b _0804EC5A
	.align 2, 0
_0804EB60: .4byte 0x0203E02C
_0804EB64:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804EB94 @ =0x0201FB00
	ldr r1, [r1]
	ldr r2, _0804EB98 @ =0x02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #0
	bne _0804EBA0
	movs r0, #0x40
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _0804EB9C @ =0x08B9CB84
	b _0804EBAA
	.align 2, 0
_0804EB94: .4byte 0x0201FB00
_0804EB98: .4byte 0x02000030
_0804EB9C: .4byte 0x08B9CB84
_0804EBA0:
	movs r0, #0xb0
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _0804EBD0 @ =0x08B9CAF8
_0804EBAA:
	movs r1, #5
	bl AnimCreate
	adds r1, r0, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x36]
	subs r0, r2, r0
	strh r0, [r1, #2]
	ldrh r0, [r5, #0x3e]
	strh r0, [r1, #4]
	ldr r0, _0804EBD4 @ =0x0201775C
	ldr r0, [r0]
	cmp r0, #1
	bne _0804EBD8
	movs r0, #0xd3
	lsls r0, r0, #6
	b _0804EBDC
	.align 2, 0
_0804EBD0: .4byte 0x08B9CAF8
_0804EBD4: .4byte 0x0201775C
_0804EBD8:
	movs r0, #0xf3
	lsls r0, r0, #6
_0804EBDC:
	strh r0, [r1, #8]
	str r1, [r5, #0x64]
	ldr r4, _0804EC68 @ =0x0200003C
	mov r0, r8
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804EC6C @ =0x06011800
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r4, _0804EC70 @ =0x0203E024
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0x39
	bne _0804EC20
	ldr r4, _0804EC74 @ =0x0200004C
	mov r0, sb
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804EC78 @ =0x02016828
	movs r2, #8
	bl CpuFastSet
_0804EC20:
	ldr r4, _0804EC74 @ =0x0200004C
	mov r0, r8
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0804EC7C @ =0x02022AC0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _0804EC80 @ =0x0203E02C
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08055468
	ldr r0, _0804EC84 @ =0x0201FB00
	ldr r0, [r0]
	bl sub_0804E6DC
_0804EC5A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804EC68: .4byte 0x0200003C
_0804EC6C: .4byte 0x06011800
_0804EC70: .4byte 0x0203E024
_0804EC74: .4byte 0x0200004C
_0804EC78: .4byte 0x02016828
_0804EC7C: .4byte 0x02022AC0
_0804EC80: .4byte 0x0203E02C
_0804EC84: .4byte 0x0201FB00

	thumb_func_start sub_0804EC88
sub_0804EC88: @ 0x0804EC88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0804ECD0 @ =0x00007FFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0804ECA6
	b _0804EDB4
_0804ECA6:
	ldr r0, _0804ECD4 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804ECD8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804ECFA
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _0804ECFA
	.align 2, 0
_0804ECD0: .4byte 0x00007FFF
_0804ECD4: .4byte 0x0203E02C
_0804ECD8:
	cmp r0, #0
	blt _0804ECFA
	cmp r0, #2
	bgt _0804ECFA
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804ECF2
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_0804ECF2:
	ldr r0, _0804ED9C @ =0x0201FB00
	ldr r0, [r0]
	bl sub_0804E6DC
_0804ECFA:
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804ED0A
	bl AnimDelete
	ldr r0, _0804EDA0 @ =0x0201FAD0
	bl sub_08055320
_0804ED0A:
	ldr r3, _0804EDA4 @ =0x02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _0804ED9C @ =0x0201FB00
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _0804EDA8 @ =0x0200002C
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl SetEkrFrontAnimPostion
	ldr r1, _0804EDAC @ =0x02017740
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804ED92
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804ED5E
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_0804ED5E:
	ldr r4, _0804EDB0 @ =0x02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r5, [r4]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r6, [r4, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r1, [r4]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
_0804ED92:
	adds r0, r7, #0
	bl Proc_End
	b _0804EFCE
	.align 2, 0
_0804ED9C: .4byte 0x0201FB00
_0804EDA0: .4byte 0x0201FAD0
_0804EDA4: .4byte 0x02000028
_0804EDA8: .4byte 0x0200002C
_0804EDAC: .4byte 0x02017740
_0804EDB0: .4byte 0x02000038
_0804EDB4:
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	cmp r4, #0
	bne _0804EDE0
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804EDE0
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0804EE3C @ =0x02023F20
	adds r0, r0, r1
	str r4, [sp]
	movs r1, #0xf
	movs r2, #5
	movs r3, #0
	bl FillBGRect
_0804EDE0:
	ldr r4, _0804EE40 @ =0x02017760
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	ldrsh r6, [r0, r1]
	mov r8, r6
	strh r6, [r4]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r3, #2
	ldrsh r5, [r0, r3]
	strh r5, [r4, #2]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804EE4C
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804EE44 @ =0x0201FB00
	ldr r1, [r1]
	ldr r2, _0804EE48 @ =0x02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	ldr r2, [r7, #0x64]
	ldrh r6, [r7, #0x36]
	ldrh r3, [r4]
	adds r0, r6, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrh r6, [r7, #0x3e]
	ldrh r4, [r4, #2]
	subs r0, r6, r4
	strh r0, [r2, #4]
	b _0804EE56
	.align 2, 0
_0804EE3C: .4byte 0x02023F20
_0804EE40: .4byte 0x02017760
_0804EE44: .4byte 0x0201FB00
_0804EE48: .4byte 0x02000030
_0804EE4C:
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
_0804EE56:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804EED0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804EE7A
	mov r0, r8
	rsbs r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
_0804EE7A:
	ldr r5, _0804EF0C @ =0x02017760
	ldr r4, _0804EF10 @ =0x02000038
	ldrh r2, [r5]
	ldrh r3, [r4]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r6, [r5, #2]
	ldrh r0, [r4, #2]
	adds r2, r6, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r6, [r4, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #2]
	ldrh r4, [r4, #2]
	adds r1, r5, r4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
_0804EED0:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804EEE4
	ldr r0, _0804EF0C @ =0x02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl SetBgOffset
_0804EEE4:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804EF20
	ldr r3, _0804EF14 @ =0x02000028
	mov ip, r3
	movs r4, #0
	ldrsh r1, [r3, r4]
	ldr r2, _0804EF0C @ =0x02017760
	movs r5, #0
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	ldr r4, _0804EF18 @ =0x0201FB00
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _0804EF1C @ =0x0200002C
	movs r0, #0
	ldrsh r1, [r3, r0]
	b _0804EF3C
	.align 2, 0
_0804EF0C: .4byte 0x02017760
_0804EF10: .4byte 0x02000038
_0804EF14: .4byte 0x02000028
_0804EF18: .4byte 0x0201FB00
_0804EF1C: .4byte 0x0200002C
_0804EF20:
	ldr r6, _0804EF88 @ =0x02000028
	mov ip, r6
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, _0804EF8C @ =0x02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	ldr r4, _0804EF90 @ =0x0201FB00
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _0804EF94 @ =0x0200002C
	movs r5, #0
	ldrsh r1, [r3, r5]
_0804EF3C:
	movs r5, #2
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	mov r8, r1
	mov r5, ip
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r0, r0, r1
	ldr r1, [r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _0804EF98 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804EF9C
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	b _0804EFCE
	.align 2, 0
_0804EF88: .4byte 0x02000028
_0804EF8C: .4byte 0x02017760
_0804EF90: .4byte 0x0201FB00
_0804EF94: .4byte 0x0200002C
_0804EF98: .4byte 0x0203E02C
_0804EF9C:
	cmp r0, #0
	blt _0804EFCE
	cmp r0, #2
	bgt _0804EFCE
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804EFC0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	b _0804EFCE
_0804EFC0:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
_0804EFCE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxFlashBgWhite
NewEfxFlashBgWhite: @ 0x0804EFDC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F00C @ =0x08B9AE4C
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r1, _0804F010 @ =0x020165C8
	ldr r2, _0804F014 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F00C: .4byte 0x08B9AE4C
_0804F010: .4byte 0x020165C8
_0804F014: .4byte 0x01000100

	thumb_func_start NewEfxFlashBgRed
NewEfxFlashBgRed: @ 0x0804F018
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F048 @ =0x08B9AE4C
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _0804F04C @ =0x001F001F
	str r0, [sp]
	ldr r1, _0804F050 @ =0x020165C8
	ldr r2, _0804F054 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F048: .4byte 0x08B9AE4C
_0804F04C: .4byte 0x001F001F
_0804F050: .4byte 0x020165C8
_0804F054: .4byte 0x01000100

	thumb_func_start NewEfxFlashBgBlack
NewEfxFlashBgBlack: @ 0x0804F058
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F084 @ =0x08B9AE4C
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [sp]
	ldr r1, _0804F088 @ =0x020165C8
	ldr r2, _0804F08C @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F084: .4byte 0x08B9AE4C
_0804F088: .4byte 0x020165C8
_0804F08C: .4byte 0x01000100

	thumb_func_start NewEfxFlashBgDirectly
NewEfxFlashBgDirectly: @ 0x0804F090
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F0AC @ =0x08B9AE4C
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F0AC: .4byte 0x08B9AE4C

	thumb_func_start EfxFlashBgMain
EfxFlashBgMain: @ 0x0804F0B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804F0E4 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804F0DC
	adds r0, r4, #0
	bl Proc_Break
_0804F0DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F0E4: .4byte 0x020165C8

	thumb_func_start sub_0804F0E8
sub_0804F0E8: @ 0x0804F0E8
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxWhiteOUT
NewEfxWhiteOUT: @ 0x0804F0FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0804F11C @ =0x08B9AE74
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F11C: .4byte 0x08B9AE74

	thumb_func_start EfxWhiteOutMain1
EfxWhiteOutMain1: @ 0x0804F120
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0804F170 @ =0x02022860
	ldr r4, _0804F174 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804F16A
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0804F16A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F170: .4byte 0x02022860
_0804F174: .4byte 0x020165C8

	thumb_func_start EfxWhiteOutMain2
EfxWhiteOutMain2: @ 0x0804F178
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _0804F1E0 @ =0x02022860
	ldr r4, _0804F1E4 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r7, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804F1D6
	adds r0, r7, #0
	bl Proc_Break
_0804F1D6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F1E0: .4byte 0x02022860
_0804F1E4: .4byte 0x020165C8

	thumb_func_start sub_0804F1E8
sub_0804F1E8: @ 0x0804F1E8
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEfxFlashHPBar
NewEfxFlashHPBar: @ 0x0804F1FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804F230 @ =0x08B9AE9C
	movs r1, #4
	bl SpawnProc
	adds r1, r0, #0
	str r6, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r4, [r1, #0x2e]
	strh r5, [r1, #0x30]
	cmp r4, #0
	bne _0804F22A
	adds r0, r1, #0
	bl Proc_Break
_0804F22A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F230: .4byte 0x08B9AE9C

	thumb_func_start EfxWhiteInMain1
EfxWhiteInMain1: @ 0x0804F234
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	blt _0804F24E
	adds r0, r2, #0
	bl Proc_Break
_0804F24E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0804F254
sub_0804F254: @ 0x0804F254
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F290
	ldr r0, _0804F274 @ =0x0203E0B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F280
	ldr r0, _0804F278 @ =0x081D9630
	ldr r1, _0804F27C @ =0x02022BC0
	b _0804F29E
	.align 2, 0
_0804F274: .4byte 0x0203E0B8
_0804F278: .4byte 0x081D9630
_0804F27C: .4byte 0x02022BC0
_0804F280:
	ldr r0, _0804F288 @ =0x081D9730
	ldr r1, _0804F28C @ =0x02022BC0
	b _0804F29E
	.align 2, 0
_0804F288: .4byte 0x081D9730
_0804F28C: .4byte 0x02022BC0
_0804F290:
	ldr r0, _0804F2A8 @ =0x0203E0B8
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x50
	bgt _0804F2B4
	ldr r0, _0804F2AC @ =0x081D9630
	ldr r1, _0804F2B0 @ =0x02022BE0
_0804F29E:
	movs r2, #0x10
	bl CpuSet
	b _0804F2BE
	.align 2, 0
_0804F2A8: .4byte 0x0203E0B8
_0804F2AC: .4byte 0x081D9630
_0804F2B0: .4byte 0x02022BE0
_0804F2B4:
	ldr r0, _0804F2E0 @ =0x081D9730
	ldr r1, _0804F2E4 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
_0804F2BE:
	bl EnablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804F2D8
	adds r0, r4, #0
	bl Proc_Break
_0804F2D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F2E0: .4byte 0x081D9730
_0804F2E4: .4byte 0x02022BE0

	thumb_func_start EfxFlashHPBarRestorePal
EfxFlashHPBarRestorePal: @ 0x0804F2E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F328
	ldr r0, _0804F310 @ =0x0203E0B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F320
	ldr r0, _0804F314 @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0804F318 @ =0x081D95B0
	adds r0, r0, r1
	ldr r1, _0804F31C @ =0x02022BC0
	b _0804F340
	.align 2, 0
_0804F310: .4byte 0x0203E0B8
_0804F314: .4byte 0x0203E020
_0804F318: .4byte 0x081D95B0
_0804F31C: .4byte 0x02022BC0
_0804F320:
	ldr r0, _0804F324 @ =0x081D9730
	b _0804F33E
	.align 2, 0
_0804F324: .4byte 0x081D9730
_0804F328:
	ldr r0, _0804F348 @ =0x0203E0B8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F358
	ldr r0, _0804F34C @ =0x0203E020
	movs r1, #2
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0804F350 @ =0x081D95B0
	adds r0, r0, r1
_0804F33E:
	ldr r1, _0804F354 @ =0x02022BE0
_0804F340:
	movs r2, #0x10
	bl CpuSet
	b _0804F362
	.align 2, 0
_0804F348: .4byte 0x0203E0B8
_0804F34C: .4byte 0x0203E020
_0804F350: .4byte 0x081D95B0
_0804F354: .4byte 0x02022BE0
_0804F358:
	ldr r0, _0804F374 @ =0x081D9730
	ldr r1, _0804F378 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
_0804F362:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F374: .4byte 0x081D9730
_0804F378: .4byte 0x02022BE0

	thumb_func_start NewEfxHpBarColorChange
NewEfxHpBarColorChange: @ 0x0804F37C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0804F438 @ =0x0201777C
	ldr r0, _0804F43C @ =0x08B9AECC
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r3, #0
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0804F440 @ =0x081D8398
	str r1, [r0, #0x48]
	str r2, [r0, #0x54]
	strh r2, [r0, #0x2e]
	str r2, [r0, #0x4c]
	ldr r1, _0804F444 @ =0x081D83C2
	str r1, [r0, #0x50]
	str r2, [r0, #0x58]
	adds r0, #0x29
	strb r3, [r0]
	ldr r5, _0804F448 @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	ldr r1, _0804F44C @ =0x081D95B0
	mov sl, r1
	add r0, sl
	ldr r6, _0804F450 @ =0x0201F93C
	adds r1, r6, #0
	movs r2, #0x10
	bl EfxSplitColor
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	ldr r1, _0804F454 @ =0x081D9670
	mov sb, r1
	add r0, sb
	ldr r4, _0804F458 @ =0x0201F96C
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r2, _0804F45C @ =0x0201F99C
	movs r0, #5
	mov r8, r0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl sub_080671AC
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r6, _0804F460 @ =0x0201F9FC
	adds r1, r6, #0
	movs r2, #0x10
	bl EfxSplitColor
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sb
	ldr r4, _0804F464 @ =0x0201FA2C
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r2, _0804F468 @ =0x0201FA5C
	mov r0, r8
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl sub_080671AC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F438: .4byte 0x0201777C
_0804F43C: .4byte 0x08B9AECC
_0804F440: .4byte 0x081D8398
_0804F444: .4byte 0x081D83C2
_0804F448: .4byte 0x0203E020
_0804F44C: .4byte 0x081D95B0
_0804F450: .4byte 0x0201F93C
_0804F454: .4byte 0x081D9670
_0804F458: .4byte 0x0201F96C
_0804F45C: .4byte 0x0201F99C
_0804F460: .4byte 0x0201F9FC
_0804F464: .4byte 0x0201FA2C
_0804F468: .4byte 0x0201FA5C

	thumb_func_start EndEfxHPBarColorChange
EndEfxHPBarColorChange: @ 0x0804F46C
	push {lr}
	ldr r0, _0804F47C @ =0x0201777C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804F47C: .4byte 0x0201777C

	thumb_func_start sub_0804F480
sub_0804F480: @ 0x0804F480
	ldr r0, _0804F48C @ =0x0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804F48C: .4byte 0x0201777C

	thumb_func_start EfxHpBarColorChange_804FC6C
EfxHpBarColorChange_804FC6C: @ 0x0804F490
	ldr r0, _0804F49C @ =0x0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804F49C: .4byte 0x0201777C

	thumb_func_start EfxHPBarColorChangeMain
EfxHPBarColorChangeMain: @ 0x0804F4A0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804F588
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804F4C6
	str r0, [r4, #0x54]
_0804F4C6:
	adds r0, r4, #0
	adds r0, #0x2e
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r2, [r4, #0x50]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804F4DE
	str r0, [r4, #0x58]
_0804F4DE:
	ldr r0, _0804F508 @ =0x0203E0B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F51C
	ldr r2, _0804F50C @ =0x0201F93C
	ldr r3, _0804F510 @ =0x0201F96C
	ldr r5, _0804F514 @ =0x0201F99C
	ldr r0, _0804F518 @ =0x02022BC0
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl EfxDecodeSplitedPalette
	b _0804F52C
	.align 2, 0
_0804F508: .4byte 0x0203E0B8
_0804F50C: .4byte 0x0201F93C
_0804F510: .4byte 0x0201F96C
_0804F514: .4byte 0x0201F99C
_0804F518: .4byte 0x02022BC0
_0804F51C:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, _0804F558 @ =0x081D9730
	adds r0, r0, r1
	ldr r1, _0804F55C @ =0x02022BC0
	movs r2, #8
	bl CpuFastSet
_0804F52C:
	ldr r0, _0804F560 @ =0x0203E0B8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F574
	ldr r2, _0804F564 @ =0x0201F9FC
	ldr r3, _0804F568 @ =0x0201FA2C
	ldr r5, _0804F56C @ =0x0201FA5C
	ldr r0, _0804F570 @ =0x02022BE0
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl EfxDecodeSplitedPalette
	b _0804F584
	.align 2, 0
_0804F558: .4byte 0x081D9730
_0804F55C: .4byte 0x02022BC0
_0804F560: .4byte 0x0203E0B8
_0804F564: .4byte 0x0201F9FC
_0804F568: .4byte 0x0201FA2C
_0804F56C: .4byte 0x0201FA5C
_0804F570: .4byte 0x02022BE0
_0804F574:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, _0804F590 @ =0x081D9730
	adds r0, r0, r1
	ldr r1, _0804F594 @ =0x02022BE0
	movs r2, #8
	bl CpuFastSet
_0804F584:
	bl EnablePalSync
_0804F588:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F590: .4byte 0x081D9730
_0804F594: .4byte 0x02022BE0

	thumb_func_start NewEfxFlashUnit
NewEfxFlashUnit: @ 0x0804F598
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804F5D0 @ =0x08B9AEEC
	movs r1, #4
	bl SpawnProc
	str r6, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F5D0: .4byte 0x08B9AEEC

	thumb_func_start sub_0804F5D4
sub_0804F5D4: @ 0x0804F5D4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804F632
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F60C
	ldr r0, _0804F604 @ =0x081D97D0
	ldr r1, _0804F608 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdateFlashingUnit
	b _0804F61C
	.align 2, 0
_0804F604: .4byte 0x081D97D0
_0804F608: .4byte 0x02022B40
_0804F60C:
	ldr r0, _0804F638 @ =0x081D97D0
	ldr r1, _0804F63C @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdateFlashingUnit
_0804F61C:
	bl EnablePalSync
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0804F632
	adds r0, r4, #0
	bl Proc_Break
_0804F632:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F638: .4byte 0x081D97D0
_0804F63C: .4byte 0x02022B80

	thumb_func_start EfxFlashUnitRestorePal
EfxFlashUnitRestorePal: @ 0x0804F640
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F66C
	ldr r0, _0804F664 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _0804F668 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl BanimSetFrontPaletteForDragon
	b _0804F67E
	.align 2, 0
_0804F664: .4byte 0x02000054
_0804F668: .4byte 0x02022B40
_0804F66C:
	ldr r0, _0804F690 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _0804F694 @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl BanimSetFrontPaletteForDragon
_0804F67E:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F690: .4byte 0x02000054
_0804F694: .4byte 0x02022B80

	thumb_func_start NewEfxStatusUnit
NewEfxStatusUnit: @ 0x0804F698
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F6B0
	ldr r0, _0804F6AC @ =0x0203E094
	b _0804F6B2
	.align 2, 0
_0804F6AC: .4byte 0x0203E094
_0804F6B0:
	ldr r0, _0804F738 @ =0x0203E098
_0804F6B2:
	ldr r6, [r0]
	ldr r0, _0804F73C @ =0x08B9AF14
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	str r5, [r4, #0x5c]
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _0804F740 @ =0x081D83E4
	str r0, [r4, #0x48]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [r4, #0x4c]
	ldr r0, _0804F744 @ =0x0203E008
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804F6E4
	str r1, [r4, #0x4c]
_0804F6E4:
	str r1, [r4, #0x50]
	strh r1, [r4, #0x36]
	strh r1, [r4, #0x34]
	strh r1, [r4, #0x32]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r1, _0804F748 @ =0x0201776C
	lsls r0, r0, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F754
	ldr r5, _0804F74C @ =0x02000054
	ldr r0, [r5]
	ldr r4, _0804F750 @ =0x02022260
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl EfxSplitColorPetrify
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl sub_080671AC
	b _0804F784
	.align 2, 0
_0804F738: .4byte 0x0203E098
_0804F73C: .4byte 0x08B9AF14
_0804F740: .4byte 0x081D83E4
_0804F744: .4byte 0x0203E008
_0804F748: .4byte 0x0201776C
_0804F74C: .4byte 0x02000054
_0804F750: .4byte 0x02022260
_0804F754:
	ldr r5, _0804F78C @ =0x02000054
	ldr r0, [r5, #4]
	ldr r4, _0804F790 @ =0x020222C0
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5, #4]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl EfxSplitColorPetrify
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl sub_080671AC
_0804F784:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F78C: .4byte 0x02000054
_0804F790: .4byte 0x020222C0

	thumb_func_start EndEfxStatusUnits
EndEfxStatusUnits: @ 0x0804F794
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0804F7CC @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _0804F7C6
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl Proc_End
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	str r1, [r0]
_0804F7C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F7CC: .4byte 0x0201776C

	thumb_func_start DisableEfxStatusUnits
DisableEfxStatusUnits: @ 0x0804F7D0
	push {r4, lr}
	ldr r4, _0804F7EC @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F7EC: .4byte 0x0201776C

	thumb_func_start EnableEfxStatusUnits
EnableEfxStatusUnits: @ 0x0804F7F0
	push {r4, lr}
	ldr r4, _0804F80C @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F80C: .4byte 0x0201776C

	thumb_func_start SetUnitEfxDebuff
SetUnitEfxDebuff: @ 0x0804F810
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _0804F83C @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	str r5, [r0, #0x4c]
	cmp r5, #0
	bne _0804F834
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl EfxStatusUnitFlashing
_0804F834:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F83C: .4byte 0x0201776C

	thumb_func_start GetUnitEfxDebuff
GetUnitEfxDebuff: @ 0x0804F840
	push {r4, lr}
	ldr r4, _0804F858 @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x4c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804F858: .4byte 0x0201776C

	thumb_func_start EfxStatusUnitFlashing
EfxStatusUnitFlashing: @ 0x0804F85C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F8C4
	ldr r0, _0804F8B8 @ =0x02000054
	ldr r0, [r0]
	ldr r4, _0804F8BC @ =0x02022B40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0804F8C0 @ =0xFFFFFD20
	adds r4, r4, r0
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalFlashingInOut
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F8E6
	mov r0, r8
	bl BanimSetFrontPaletteForDragon
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalFlashingInOut
	b _0804F8E6
	.align 2, 0
_0804F8B8: .4byte 0x02000054
_0804F8BC: .4byte 0x02022B40
_0804F8C0: .4byte 0xFFFFFD20
_0804F8C4:
	ldr r0, _0804F8F4 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r4, _0804F8F8 @ =0x02022B80
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0804F8FC @ =0xFFFFFCE0
	adds r4, r4, r0
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalFlashingInOut
_0804F8E6:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F8F4: .4byte 0x02000054
_0804F8F8: .4byte 0x02022B80
_0804F8FC: .4byte 0xFFFFFCE0

	thumb_func_start EfxStatusUnit_Loop
EfxStatusUnit_Loop: @ 0x0804F900
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	beq _0804F9F6
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804F9F6
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	cmp r1, r0
	beq _0804F92A
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	str r1, [r4, #0x50]
_0804F92A:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0804F97A
	ldr r0, [r4, #0x4c]
	cmp r0, #2
	beq _0804F962
	cmp r0, #2
	bgt _0804F950
	cmp r0, #1
	beq _0804F95A
	b _0804F974
_0804F950:
	cmp r0, #3
	beq _0804F974
	cmp r0, #4
	beq _0804F96A
	b _0804F974
_0804F95A:
	movs r0, #0
	strh r1, [r4, #0x32]
	strh r0, [r4, #0x34]
	b _0804F978
_0804F962:
	movs r0, #0
	strh r0, [r4, #0x32]
	strh r0, [r4, #0x34]
	b _0804F978
_0804F96A:
	movs r0, #0
	strh r1, [r4, #0x32]
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	b _0804F97A
_0804F974:
	strh r1, [r4, #0x32]
	strh r1, [r4, #0x34]
_0804F978:
	strh r1, [r4, #0x36]
_0804F97A:
	ldr r0, [r4, #0x4c]
	cmp r0, #3
	beq _0804F9A2
	cmp r0, #3
	bgt _0804F98A
	cmp r0, #1
	blt _0804F9F2
	b _0804F98E
_0804F98A:
	cmp r0, #4
	bne _0804F9F2
_0804F98E:
	ldr r0, [r4, #0x5c]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl EfxStatusUnitFlashing
	b _0804F9F2
_0804F9A2:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F9D4
	ldr r0, _0804F9CC @ =0x02022B40
	ldr r1, _0804F9D0 @ =0x02022260
	adds r2, r1, #0
	adds r2, #0x30
	movs r6, #0xc0
	lsls r6, r6, #1
	adds r3, r1, r6
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl EfxDecodeSplitedPalette
	b _0804F9F2
	.align 2, 0
_0804F9CC: .4byte 0x02022B40
_0804F9D0: .4byte 0x02022260
_0804F9D4:
	ldr r0, _0804FA00 @ =0x02022B80
	ldr r1, _0804FA04 @ =0x020222C0
	adds r2, r1, #0
	adds r2, #0x30
	movs r5, #0xa8
	lsls r5, r5, #2
	adds r3, r1, r5
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl EfxDecodeSplitedPalette
_0804F9F2:
	bl EnablePalSync
_0804F9F6:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FA00: .4byte 0x02022B80
_0804FA04: .4byte 0x020222C0

	thumb_func_start sub_0804FA08
sub_0804FA08: @ 0x0804FA08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804FA2C
	ldr r0, _0804FA24 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _0804FA28 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	b _0804FA38
	.align 2, 0
_0804FA24: .4byte 0x02000054
_0804FA28: .4byte 0x02022B40
_0804FA2C:
	ldr r0, _0804FA48 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _0804FA4C @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
_0804FA38:
	ldr r0, [r4, #0x5c]
	bl BanimSetFrontPaletteForDragon
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FA48: .4byte 0x02000054
_0804FA4C: .4byte 0x02022B80

	thumb_func_start NewEfxWeaponIcon
NewEfxWeaponIcon: @ 0x0804FA50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804FA8C @ =0x08B9AF3C
	movs r1, #3
	bl SpawnProc
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0804FA90 @ =0x081D8406
	str r1, [r0, #0x48]
	str r2, [r0, #0x4c]
	str r2, [r0, #0x50]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x54]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [r0, #0x58]
	ldr r1, _0804FA94 @ =0x02017774
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FA8C: .4byte 0x08B9AF3C
_0804FA90: .4byte 0x081D8406
_0804FA94: .4byte 0x02017774

	thumb_func_start EndProcEfxWeaponIcon
EndProcEfxWeaponIcon: @ 0x0804FA98
	push {r4, lr}
	ldr r4, _0804FAB0 @ =0x02017774
	ldr r0, [r4]
	cmp r0, #0
	beq _0804FAAA
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0804FAAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FAB0: .4byte 0x02017774

	thumb_func_start DisableEfxWeaponIcon
DisableEfxWeaponIcon: @ 0x0804FAB4
	ldr r0, _0804FAC0 @ =0x02017774
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804FAC0: .4byte 0x02017774

	thumb_func_start EnableEfxWeaponIcon
EnableEfxWeaponIcon: @ 0x0804FAC4
	ldr r0, _0804FAD0 @ =0x02017774
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804FAD0: .4byte 0x02017774

	thumb_func_start sub_0804FAD4
sub_0804FAD4: @ 0x0804FAD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #1
	beq _0804FB32
	bl InitIcons
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804FAFA
	str r0, [r4, #0x4c]
_0804FAFA:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _0804FB14
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	ldr r0, _0804FB38 @ =0x02022860
	ldr r3, [r4, #0x4c]
	movs r1, #0x1d
	movs r2, #1
	bl EfxPalWhiteInOut
_0804FB14:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _0804FB2E
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, _0804FB38 @ =0x02022860
	ldr r3, [r4, #0x4c]
	movs r1, #0x1e
	movs r2, #1
	bl EfxPalWhiteInOut
_0804FB2E:
	bl EnablePalSync
_0804FB32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FB38: .4byte 0x02022860

	thumb_func_start sub_0804FB3C
sub_0804FB3C: @ 0x0804FB3C
	push {r4, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _0804FB52
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
_0804FB52:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _0804FB60
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
_0804FB60:
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEfxSpellCast
NewEfxSpellCast: @ 0x0804FB6C
	push {r4, r5, lr}
	bl CheckInEkrDragon
	adds r4, r0, #0
	cmp r4, #0
	bne _0804FBB8
	ldr r0, _0804FBA0 @ =0x08B9AF64
	movs r1, #4
	bl SpawnProc
	adds r5, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	strh r4, [r5, #0x2c]
	movs r0, #4
	strh r0, [r5, #0x2e]
	ldr r0, _0804FBA4 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	bne _0804FBB0
	ldr r0, _0804FBA8 @ =0x02022920
	ldr r1, _0804FBAC @ =0x0201C784
	movs r2, #0x50
	bl CpuFastSet
	b _0804FBB4
	.align 2, 0
_0804FBA0: .4byte 0x08B9AF64
_0804FBA4: .4byte 0x02017778
_0804FBA8: .4byte 0x02022920
_0804FBAC: .4byte 0x0201C784
_0804FBB0:
	bl Proc_End
_0804FBB4:
	ldr r0, _0804FBC0 @ =0x02017778
	str r5, [r0]
_0804FBB8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FBC0: .4byte 0x02017778

	thumb_func_start RegisterEfxSpellCastEnd
RegisterEfxSpellCastEnd: @ 0x0804FBC4
	ldr r0, _0804FBD8 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _0804FBD4
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_0804FBD4:
	bx lr
	.align 2, 0
_0804FBD8: .4byte 0x02017778

	thumb_func_start sub_0804FBDC
sub_0804FBDC: @ 0x0804FBDC
	push {lr}
	ldr r1, _0804FBF4 @ =0x02017778
	ldr r0, [r1]
	cmp r0, #0
	beq _0804FBEE
	movs r0, #0
	str r0, [r1]
	bl Proc_End
_0804FBEE:
	pop {r0}
	bx r0
	.align 2, 0
_0804FBF4: .4byte 0x02017778

	thumb_func_start sub_0804FBF8
sub_0804FBF8: @ 0x0804FBF8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0804FC54 @ =0x0201C784
	ldr r4, _0804FC58 @ =0x02022920
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _0804FC4C
	adds r0, r6, #0
	bl Proc_Break
_0804FC4C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC54: .4byte 0x0201C784
_0804FC58: .4byte 0x02022920

	thumb_func_start sub_0804FC5C
sub_0804FC5C: @ 0x0804FC5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804FC94 @ =0x0201C784
	ldr r4, _0804FC98 @ =0x02022920
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #8
	bl EfxPalBlackInOut
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804FC8E
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0804FC8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC94: .4byte 0x0201C784
_0804FC98: .4byte 0x02022920

	thumb_func_start sub_0804FC9C
sub_0804FC9C: @ 0x0804FC9C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r7, _0804FD10 @ =0x0201C784
	ldr r6, _0804FD14 @ =0x02022920
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl CpuFastSet
	adds r0, r6, #0
	subs r0, #0xc0
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _0804FD06
	ldr r1, _0804FD18 @ =0x02017778
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
_0804FD06:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD10: .4byte 0x0201C784
_0804FD14: .4byte 0x02022920
_0804FD18: .4byte 0x02017778

	thumb_func_start sub_0804FD1C
sub_0804FD1C: @ 0x0804FD1C
	push {r4, r5, lr}
	ldr r0, _0804FD4C @ =0x08B9AF94
	movs r1, #4
	bl SpawnProc
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x2c]
	movs r0, #4
	strh r0, [r4, #0x2e]
	ldr r5, _0804FD50 @ =0x02017778
	ldr r0, [r5]
	cmp r0, #0
	beq _0804FD42
	bl Proc_End
_0804FD42:
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD4C: .4byte 0x08B9AF94
_0804FD50: .4byte 0x02017778

	thumb_func_start sub_0804FD54
sub_0804FD54: @ 0x0804FD54
	ldr r0, _0804FD68 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _0804FD64
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_0804FD64:
	bx lr
	.align 2, 0
_0804FD68: .4byte 0x02017778

	thumb_func_start sub_0804FD6C
sub_0804FD6C: @ 0x0804FD6C
	ldr r0, _0804FD80 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	beq _0804FD7C
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
_0804FD7C:
	bx lr
	.align 2, 0
_0804FD80: .4byte 0x02017778

	thumb_func_start sub_0804FD84
sub_0804FD84: @ 0x0804FD84
	push {lr}
	ldr r1, _0804FD9C @ =0x02017778
	ldr r0, [r1]
	cmp r0, #0
	beq _0804FD96
	movs r0, #0
	str r0, [r1]
	bl Proc_End
_0804FD96:
	pop {r0}
	bx r0
	.align 2, 0
_0804FD9C: .4byte 0x02017778

	thumb_func_start sub_0804FDA0
sub_0804FDA0: @ 0x0804FDA0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, _0804FDCC @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0804FDD0
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	bl EfxChapterMapFadeOUT
	b _0804FE00
	.align 2, 0
_0804FDCC: .4byte 0x0203E00A
_0804FDD0:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0
	ldrsh r0, [r6, r2]
	subs r0, #1
	bl PutBanimBgPAL
	ldr r0, _0804FE24 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
_0804FE00:
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _0804FE1A
	adds r0, r5, #0
	bl Proc_Break
_0804FE1A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FE24: .4byte 0x02022860

	thumb_func_start sub_0804FE28
sub_0804FE28: @ 0x0804FE28
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804FE5A
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0804FE60 @ =0x081D8434
	str r0, [r4, #0x48]
	ldr r0, _0804FE64 @ =0x08B9AFD4
	str r0, [r4, #0x4c]
	ldr r0, _0804FE68 @ =0x082C7ED0
	ldr r1, _0804FE6C @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _0804FE70 @ =0x082CD6C4
	ldr r1, _0804FE74 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	bl Proc_Break
_0804FE5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FE60: .4byte 0x081D8434
_0804FE64: .4byte 0x08B9AFD4
_0804FE68: .4byte 0x082C7ED0
_0804FE6C: .4byte 0x06008000
_0804FE70: .4byte 0x082CD6C4
_0804FE74: .4byte 0x02022920

	thumb_func_start sub_0804FE78
sub_0804FE78: @ 0x0804FE78
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0804FEF4 @ =0x0201B784
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0804FEBC
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r1, _0804FEF8 @ =0x02024460
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
	movs r0, #8
	bl EnableBgSync
_0804FEBC:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804FEEA
	ldr r0, _0804FEF8 @ =0x02024460
	ldr r1, _0804FEFC @ =0x0000601F
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r0, _0804FF00 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
_0804FEEA:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FEF4: .4byte 0x0201B784
_0804FEF8: .4byte 0x02024460
_0804FEFC: .4byte 0x0000601F
_0804FF00: .4byte 0x02022860

	thumb_func_start sub_0804FF04
sub_0804FF04: @ 0x0804FF04
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804FF24 @ =0x0203E00A
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804FF2C
	ldr r0, _0804FF28 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl ApplyChapterMapGraphics
	bl RenderMap
	b _0804FF36
	.align 2, 0
_0804FF24: .4byte 0x0203E00A
_0804FF28: .4byte 0x0202BBF8
_0804FF2C:
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r0, #1
	bl PutBanimBG
_0804FF36:
	ldr r0, _0804FF5C @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePalSync
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #4
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FF5C: .4byte 0x02022860

	thumb_func_start sub_0804FF60
sub_0804FF60: @ 0x0804FF60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, _0804FF8C @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0804FF90
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	adds r4, r0, #0
	bl EfxChapterMapFadeOUT
	b _0804FFC0
	.align 2, 0
_0804FF8C: .4byte 0x0203E00A
_0804FF90:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0
	ldrsh r0, [r6, r2]
	subs r0, #1
	bl PutBanimBgPAL
	ldr r0, _0804FFE8 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
_0804FFC0:
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _0804FFE0
	ldr r1, _0804FFEC @ =0x02017778
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0804FFE0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FFE8: .4byte 0x02022860
_0804FFEC: .4byte 0x02017778

	thumb_func_start SpellFx_Begin
SpellFx_Begin: @ 0x0804FFF0
	ldr r1, _0804FFF8 @ =0x0201772C
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0804FFF8: .4byte 0x0201772C

	thumb_func_start SpellFx_Finish
SpellFx_Finish: @ 0x0804FFFC
	ldr r1, _08050004 @ =0x0201772C
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08050004: .4byte 0x0201772C

	thumb_func_start SpellFx_SetBG1Position
SpellFx_SetBG1Position: @ 0x08050008
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	thumb_func_start SpellFx_ClearBG1
SpellFx_ClearBG1: @ 0x08050018
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08050038 @ =0x02023460
	ldr r2, _0805003C @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08050038: .4byte 0x02023460
_0805003C: .4byte 0x01000200

	thumb_func_start SpellFx_SetSomeColorEffect
SpellFx_SetSomeColorEffect: @ 0x08050040
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0805010C @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	movs r3, #0x10
	mov r8, r3
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _08050110 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08050114 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r5, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r2, r8
	orrs r1, r2
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	orrs r1, r5
	strb r1, [r6]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r5, r1
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805010C: .4byte 0x03002870
_08050110: .4byte 0x0000FFE0
_08050114: .4byte 0x0000E0FF

	thumb_func_start SpellFx_ClearColorEffects
SpellFx_ClearColorEffects: @ 0x08050118
	ldr r3, _0805013C @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0805013C: .4byte 0x03002870

	thumb_func_start StartBattleAnimHitEffectsDefault
StartBattleAnimHitEffectsDefault: @ 0x08050140
	push {lr}
	movs r2, #3
	movs r3, #4
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08050150
sub_08050150: @ 0x08050150
	push {lr}
	movs r2, #5
	movs r3, #5
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartBattleAnimHitEffects
StartBattleAnimHitEffects: @ 0x08050160
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r1, #0
	str r2, [sp]
	mov sl, r3
	bl GetAnimPosition
	cmp r0, #0
	bne _0805018C
	ldr r0, _08050188 @ =0x02000000
	ldr r7, [r0, #8]
	ldr r1, [r0, #0xc]
	mov sb, r1
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b _08050198
	.align 2, 0
_08050188: .4byte 0x02000000
_0805018C:
	ldr r0, _080501A8 @ =0x02000000
	ldr r7, [r0]
	ldr r1, [r0, #4]
	mov sb, r1
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
_08050198:
	mov r8, r0
	cmp r4, #0
	beq _080501AC
	cmp r4, #1
	bne _080501A4
	b _080502D6
_080501A4:
	b _080502DC
	.align 2, 0
_080501A8: .4byte 0x02000000
_080501AC:
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080501FC
	adds r0, r7, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _080501FC
	adds r0, r7, #0
	movs r1, #1
	bl SetUnitEfxDebuff
_080501FC:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq _0805021E
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _0805021E
	adds r0, r5, #0
	movs r1, #1
	bl SetUnitEfxDebuff
_0805021E:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08050234
	asrs r0, r4, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0805023C
_08050234:
	adds r0, r5, #0
	adds r5, r7, #0
	adds r7, r0, #0
	mov r8, sb
_0805023C:
	ldr r4, _080502A4 @ =0x0203E05E
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r6, r4
	beq _080502CA
	adds r0, r5, #0
	bl NewEfxHPBar
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _080502A8
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sl
	bl NewEfxHitQuake
	b _080502B2
	.align 2, 0
_080502A4: .4byte 0x0203E05E
_080502A8:
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp]
	bl NewEfxHitQuake
_080502B2:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl NewEfxFlashHPBar
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxFlashUnit
	b _080502DC
_080502CA:
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0
	bl NewEfxNoDmage
	b _080502DC
_080502D6:
	adds r0, r5, #0
	bl NewEfxAvoid
_080502DC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StartBattleAnimResireHitEffects
StartBattleAnimResireHitEffects: @ 0x080502EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r1
	bl GetAnimPosition
	cmp r0, #0
	bne _0805030C
	ldr r0, _08050308 @ =0x02000000
	ldr r7, [r0, #8]
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b _08050314
	.align 2, 0
_08050308: .4byte 0x02000000
_0805030C:
	ldr r0, _0805036C @ =0x02000000
	ldr r7, [r0]
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
_08050314:
	mov r8, r0
	ldr r4, _08050370 @ =0x0203E05E
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	mov r0, sb
	cmp r0, #0
	beq _08050374
	cmp r0, #1
	beq _080503CC
	b _080503D2
	.align 2, 0
_0805036C: .4byte 0x02000000
_08050370: .4byte 0x0203E05E
_08050374:
	cmp r6, r4
	beq _080503B6
	adds r0, r5, #0
	bl NewEfxHpBarResire
	adds r0, r7, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08050394
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #4
	bl NewEfxHitQuake
	b _0805039E
_08050394:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #3
	bl NewEfxHitQuake
_0805039E:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl NewEfxFlashHPBar
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxFlashUnit
	b _080503D2
_080503B6:
	ldr r1, _080503C8 @ =0x02017750
	movs r0, #2
	str r0, [r1]
	adds r0, r5, #0
	mov r1, r8
	movs r2, #1
	bl NewEfxNoDmage
	b _080503D2
	.align 2, 0
_080503C8: .4byte 0x02017750
_080503CC:
	adds r0, r5, #0
	bl NewEfxAvoid
_080503D2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartBattleAnimStatusChgHitEffects
StartBattleAnimStatusChgHitEffects: @ 0x080503E0
	push {r4, lr}
	adds r4, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080503F8
	ldr r0, _080503F4 @ =0x02000000
	ldr r0, [r0]
	b _080503FC
	.align 2, 0
_080503F4: .4byte 0x02000000
_080503F8:
	ldr r0, _08050408 @ =0x02000000
	ldr r0, [r0, #8]
_080503FC:
	cmp r4, #0
	beq _0805040C
	cmp r4, #1
	beq _08050412
	b _08050416
	.align 2, 0
_08050408: .4byte 0x02000000
_0805040C:
	bl NewEfxStatusCHG
	b _08050416
_08050412:
	bl NewEfxAvoid
_08050416:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EfxCreateFrontAnim
EfxCreateFrontAnim: @ 0x0805041C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, _08050440 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050448
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050444
	adds r0, r7, #0
	b _08050458
	.align 2, 0
_08050440: .4byte 0x0203E02C
_08050444:
	adds r0, r6, #0
	b _08050458
_08050448:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050456
	adds r0, r5, #0
	b _08050458
_08050456:
	ldr r0, [sp, #0x14]
_08050458:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EfxCreateBackAnim
EfxCreateBackAnim: @ 0x08050478
	push {r4, lr}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, _080504AC @ =0x0203E02C
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r2, #0
	cmp r0, #0
	bne _0805048C
	adds r4, r1, #0
_0805048C:
	adds r0, r3, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080504B4
	ldr r1, _080504B0 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _080504C8
	.align 2, 0
_080504AC: .4byte 0x0203E02C
_080504B0: .4byte 0x02023460
_080504B4:
	ldr r1, _080504D8 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_080504C8:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080504D8: .4byte 0x02023460

	thumb_func_start SpellFx_WriteBgMap
SpellFx_WriteBgMap: @ 0x080504DC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _080504F8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050500
	ldr r1, _080504FC @ =0x02019784
	adds r0, r3, #0
	bl LZ77UnCompWram
	b _08050508
	.align 2, 0
_080504F8: .4byte 0x0203E02C
_080504FC: .4byte 0x02019784
_08050500:
	ldr r1, _0805052C @ =0x02019784
	adds r0, r2, #0
	bl LZ77UnCompWram
_08050508:
	ldr r5, _0805052C @ =0x02019784
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050534
	ldr r1, _08050530 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08050548
	.align 2, 0
_0805052C: .4byte 0x02019784
_08050530: .4byte 0x02023460
_08050534:
	ldr r1, _08050558 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08050548:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050558: .4byte 0x02023460

	thumb_func_start SpellFx_WriteBgMapExt
SpellFx_WriteBgMapExt: @ 0x0805055C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, _08050594 @ =0x02019784
	adds r1, r7, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805059C
	ldr r1, _08050598 @ =0x02023460
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBgHFlip
	b _080505B4
	.align 2, 0
_08050594: .4byte 0x02019784
_08050598: .4byte 0x02023460
_0805059C:
	ldr r1, _080505C4 @ =0x02023460
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBG
_080505B4:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080505C4: .4byte 0x02023460

	thumb_func_start SpellFx_RegisterObjGfx
SpellFx_RegisterObjGfx: @ 0x080505C8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _080505E8 @ =0x06010800
	ldr r4, _080505EC @ =0x0201A784
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080505E8: .4byte 0x06010800
_080505EC: .4byte 0x0201A784

	thumb_func_start SpellFx_RegisterObjPal
SpellFx_RegisterObjPal: @ 0x080505F0
	push {lr}
	adds r2, r1, #0
	ldr r1, _08050608 @ =0x02022AA0
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_08050608: .4byte 0x02022AA0

	thumb_func_start SpellFx_RegisterBgGfx
SpellFx_RegisterBgGfx: @ 0x0805060C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _0805062C @ =0x06002000
	ldr r4, _08050630 @ =0x02017784
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805062C: .4byte 0x06002000
_08050630: .4byte 0x02017784

	thumb_func_start SpellFx_RegisterBgPal
SpellFx_RegisterBgPal: @ 0x08050634
	push {lr}
	adds r2, r1, #0
	ldr r1, _0805064C @ =0x02022880
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_0805064C: .4byte 0x02022880

	thumb_func_start sub_08050650
sub_08050650: @ 0x08050650
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _08050676
_0805065E:
	cmp r2, r5
	blo _08050664
	movs r2, #0
_08050664:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _0805065E
_08050676:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805067C
sub_0805067C: @ 0x0805067C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _080506A2
_0805068A:
	cmp r2, r5
	blo _08050690
	movs r2, #0
_08050690:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1, #0x20]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _0805068A
_080506A2:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080506AC
sub_080506AC: @ 0x080506AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _080506D8
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r1, r0
_080506C0:
	cmp r2, r5
	blo _080506C6
	movs r2, #0
_080506C6:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _080506C0
_080506D8:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EfxAdvanceFrameLut
EfxAdvanceFrameLut: @ 0x080506E4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	ldrh r0, [r5]
	adds r6, r0, #0
	cmp r6, #0
	bne _0805075C
	ldrh r0, [r3]
	mov ip, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050720
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050720
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050720
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050724
_08050720:
	adds r0, r1, #0
	b _08050764
_08050724:
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050732
	strh r6, [r3]
	ldrh r4, [r2]
	b _08050746
_08050732:
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050746
	mov r0, ip
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
_08050746:
	ldrh r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	adds r1, #1
	strh r1, [r3]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	b _08050764
_0805075C:
	subs r0, #1
	strh r0, [r5]
	movs r0, #7
	rsbs r0, r0, #0
_08050764:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0805076C
sub_0805076C: @ 0x0805076C
	ldr r1, _08050774 @ =0x0201775C
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08050774: .4byte 0x0201775C

	thumb_func_start EfxGetCamMovDuration
EfxGetCamMovDuration: @ 0x08050778
	ldr r0, _08050788 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0805078C
	movs r0, #0x18
	b _08050796
	.align 2, 0
_08050788: .4byte 0x0203E02C
_0805078C:
	cmp r0, #1
	beq _08050794
	movs r0, #0
	b _08050796
_08050794:
	movs r0, #0x10
_08050796:
	bx lr

	thumb_func_start sub_08050798
sub_08050798: @ 0x08050798
	push {lr}
	sub sp, #4
	ldr r1, _080507B0 @ =0x0201C8C4
	str r0, [sp]
	ldr r2, _080507B4 @ =0x050002D6
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080507B0: .4byte 0x0201C8C4
_080507B4: .4byte 0x050002D6

	thumb_func_start sub_080507B8
sub_080507B8: @ 0x080507B8
	push {lr}
	sub sp, #4
	ldr r1, _080507D0 @ =0x0201D41C
	str r0, [sp]
	ldr r2, _080507D4 @ =0x05000948
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080507D0: .4byte 0x0201D41C
_080507D4: .4byte 0x05000948

	thumb_func_start SetEkrFrontAnimPostion
SetEkrFrontAnimPostion: @ 0x080507D8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #0
	bne _080507F4
	ldr r0, _080507F0 @ =0x02000000
	ldr r3, [r0]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #4]
	b _080507FE
	.align 2, 0
_080507F0: .4byte 0x02000000
_080507F4:
	ldr r0, _08050804 @ =0x02000000
	ldr r3, [r0, #8]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #0xc]
_080507FE:
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_08050804: .4byte 0x02000000

	thumb_func_start sub_08050808
sub_08050808: @ 0x08050808
	ldr r0, _08050810 @ =0x0201FABC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08050810: .4byte 0x0201FABC

	thumb_func_start sub_08050814
sub_08050814: @ 0x08050814
	ldr r1, _0805081C @ =0x0201FABC
	str r0, [r1]
	bx lr
	.align 2, 0
_0805081C: .4byte 0x0201FABC

	thumb_func_start NewEfxspdquake
NewEfxspdquake: @ 0x08050820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805083C @ =0x08B9AFE4
	movs r1, #1
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r1, _08050840 @ =0x081D7F22
	str r1, [r0, #0x44]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805083C: .4byte 0x08B9AFE4
_08050840: .4byte 0x081D7F22

	thumb_func_start sub_08050844
sub_08050844: @ 0x08050844
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x44]
	mov r8, r0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	add r0, r8
	ldrh r4, [r0, #2]
	ldr r3, _080508C8 @ =0x02000000
	ldr r6, [r3]
	ldrh r2, [r0]
	mov ip, r2
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldrh r1, [r6, #2]
	adds r0, r1, r2
	movs r5, #0
	mov sb, r5
	strh r0, [r6, #2]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #4]
	ldrh r5, [r6, #2]
	adds r0, r5, r2
	strh r0, [r6, #2]
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #8]
	ldrh r5, [r6, #2]
	adds r0, r5, r2
	strh r0, [r6, #2]
	ldrh r5, [r6, #4]
	adds r0, r5, r1
	strh r0, [r6, #4]
	ldr r6, [r3, #0xc]
	ldrh r0, [r6, #2]
	adds r2, r0, r2
	strh r2, [r6, #2]
	ldrh r2, [r6, #4]
	adds r1, r2, r1
	strh r1, [r6, #4]
	ldr r0, _080508CC @ =0x03002870
	ldrh r1, [r0, #0x26]
	mov r2, ip
	subs r5, r1, r2
	strh r5, [r0, #0x26]
	ldrh r5, [r0, #0x24]
	subs r4, r5, r4
	strh r4, [r0, #0x24]
	bl sub_08050808
	cmp r0, #0
	bne _080508D0
	adds r0, r7, #0
	bl Proc_Break
	b _08050906
	.align 2, 0
_080508C8: .4byte 0x02000000
_080508CC: .4byte 0x03002870
_080508D0:
	bl sub_08050808
	cmp r0, #2
	bne _080508EC
	ldr r0, _080508E8 @ =0x081D7FB6
	str r0, [r7, #0x44]
	mov r0, sb
	strh r0, [r7, #0x2c]
	movs r0, #3
	bl sub_08050814
	b _08050906
	.align 2, 0
_080508E8: .4byte 0x081D7FB6
_080508EC:
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _08050914 @ =0x00007FFF
	ldrh r0, [r0]
	cmp r0, r1
	bne _08050906
	mov r2, sb
	strh r2, [r7, #0x2c]
_08050906:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050914: .4byte 0x00007FFF

	thumb_func_start sub_08050918
sub_08050918: @ 0x08050918
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r2, _08050968 @ =0x02000028
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r6, _0805096C @ =0x0201FB00
	ldr r0, [r6]
	subs r1, r1, r0
	ldr r3, _08050970 @ =0x0200002C
	movs r5, #2
	ldrsh r4, [r2, r5]
	subs r4, r4, r0
	movs r0, #2
	ldrsh r5, [r3, r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	ldr r0, _08050974 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _08050986
	.align 2, 0
_08050968: .4byte 0x02000028
_0805096C: .4byte 0x0201FB00
_08050970: .4byte 0x0200002C
_08050974: .4byte 0x0203E02C
_08050978:
	cmp r0, #0
	blt _08050986
	cmp r0, #2
	bgt _08050986
	ldr r0, [r6]
	bl sub_0804E6DC
_08050986:
	adds r0, r7, #0
	bl Proc_Break
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetupBanim
SetupBanim: @ 0x08050994
	push {lr}
	bl PrepareBattleGraphicsMaybe
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start BeginAnimsOnBattleAnimations
BeginAnimsOnBattleAnimations: @ 0x080509A4
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _080509B4
	bl BeginAnimsOnBattle_Arena
	b _080509F4
_080509B4:
	bl CheckBanimHensei
	cmp r0, #1
	bne _080509C2
	bl BeginAnimsOnBattle_Hensei
	b _080509F4
_080509C2:
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl GetBanimInitPosReal
	ldr r1, _080509F8 @ =0x02017744
	str r0, [r1]
	bl NewEkrBattleStarting
	ldr r0, _080509FC @ =0x02000000
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, _08050A00 @ =0x02000010
	str r1, [r0]
	str r1, [r0, #4]
	ldr r0, _08050A04 @ =MainUpdate_8055C68
	bl SetMainFunc
	movs r0, #0
	bl SetOnHBlankA
_080509F4:
	pop {r0}
	bx r0
	.align 2, 0
_080509F8: .4byte 0x02017744
_080509FC: .4byte 0x02000000
_08050A00: .4byte 0x02000010
_08050A04: .4byte MainUpdate_8055C68

	thumb_func_start EkrBattleEndRountine
EkrBattleEndRountine: @ 0x08050A08
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08050A18
	bl ExecBattleAnimArenaExit
	b _08050A30
_08050A18:
	bl CheckBanimHensei
	cmp r0, #1
	bne _08050A26
	bl ExecEkrHenseiEnd
	b _08050A30
_08050A26:
	bl NewEkrbattleending
	ldr r0, _08050A34 @ =MainUpdate_8055C68
	bl SetMainFunc
_08050A30:
	pop {r0}
	bx r0
	.align 2, 0
_08050A34: .4byte MainUpdate_8055C68

	thumb_func_start MainUpdate_8055C68
MainUpdate_8055C68: @ 0x08050A38
	push {r4, lr}
	ldr r0, _08050A9C @ =0x08B857F8
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, _08050AA0 @ =0x02026A30
	ldr r0, [r4, #4]
	bl Proc_Run
	bl GetGameLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08050A5E
	ldr r0, [r4, #8]
	bl Proc_Run
_08050A5E:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl AnimUpdateAll
	bl BattleAIS_ExecCommands
	movs r0, #0xd
	bl PutSpriteLayerOam
	ldr r1, _08050AA4 @ =0x0202BBB8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08050AA8 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050A9C: .4byte 0x08B857F8
_08050AA0: .4byte 0x02026A30
_08050AA4: .4byte 0x0202BBB8
_08050AA8: .4byte 0x04000006

	thumb_func_start NewEkrBattleStarting
NewEkrBattleStarting: @ 0x08050AAC
	push {lr}
	ldr r0, _08050ABC @ =0x08B9B004
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_08050ABC: .4byte 0x08B9B004

	thumb_func_start sub_08050AC0
sub_08050AC0: @ 0x08050AC0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	movs r3, #0
	strh r3, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	ldr r2, _08050BC0 @ =0x0203E02E
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r6, #4
	ldrsh r1, [r2, r6]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x34]
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r6, #6
	ldrsh r1, [r2, r6]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3c]
	strh r0, [r5, #0x3a]
	str r3, [sp]
	ldr r1, _08050BC4 @ =0x02023C60
	ldr r2, _08050BC8 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #4
	bl EnableBgSync
	ldr r6, _08050BCC @ =0x03002870
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #4
	mov sl, r0
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08050BD0 @ =0x0000FFE0
	ldrh r1, [r6, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strh r0, [r6, #0x3c]
	movs r2, #0x20
	mov sb, r2
	mov r0, sb
	ldrb r1, [r6, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r0, r6, #0
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r6
	mov r8, r2
	movs r0, #1
	ldrb r1, [r2]
	orrs r1, r0
	movs r4, #2
	orrs r1, r4
	mov r2, sl
	orrs r1, r2
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	adds r6, #0x36
	ldrb r2, [r6]
	orrs r0, r2
	orrs r0, r4
	mov r2, sl
	orrs r0, r2
	orrs r0, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	subs r2, #0x10
	ands r1, r2
	mov r2, r8
	strb r1, [r2]
	mov r1, sb
	orrs r0, r1
	strb r0, [r6]
	adds r0, r5, #0
	bl Proc_Break
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050BC0: .4byte 0x0203E02E
_08050BC4: .4byte 0x02023C60
_08050BC8: .4byte 0x01000200
_08050BCC: .4byte 0x03002870
_08050BD0: .4byte 0x0000FFE0

	thumb_func_start sub_08050BD4
sub_08050BD4: @ 0x08050BD4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	ldrh r1, [r7, #0x2e]
	cmp r0, r1
	beq _08050BEC
	adds r0, #1
	strh r0, [r7, #0x2c]
_08050BEC:
	movs r0, #0x32
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r6, r0, #0
	movs r0, #0x3a
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x34
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	bl Interpolate
	ldr r1, _08050CD4 @ =0x03002870
	movs r2, #0x2d
	adds r2, r2, r1
	mov r8, r2
	movs r2, #0
	mov sb, r2
	mov r2, r8
	strb r6, [r2]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	ldrh r0, [r7, #0x2c]
	ldrh r2, [r7, #0x2e]
	cmp r0, r2
	bne _08050CC4
	adds r2, r1, #0
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl InitOam
	bl LockBmDisplay
	mov r0, sb
	mov r2, r8
	strb r0, [r2]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	ldr r0, _08050CD8 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	movs r3, #4
	bl EfxPalBlackInOut
	bl EnablePalSync
	bl EndAllMus
	adds r0, r7, #0
	bl Proc_Break
_08050CC4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050CD4: .4byte 0x03002870
_08050CD8: .4byte 0x02022860

	thumb_func_start ekrBaStart_InitBattleScreen
ekrBaStart_InitBattleScreen: @ 0x08050CDC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08050D08 @ =0x0203E008
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050D40
	bl NewEkrGauge
	bl NewEkrDispUP
	ldr r0, _08050D0C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _08050D10
	cmp r0, #3
	ble _08050D40
	cmp r0, #4
	beq _08050D38
	b _08050D40
	.align 2, 0
_08050D08: .4byte 0x0203E008
_08050D0C: .4byte 0x0203E02C
_08050D10:
	ldr r4, _08050D34 @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08050D22
	bl EkrGauge_0804CC48
	bl EkrDispUP_0804D5A4
_08050D22:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08050D40
	bl EkrGauge_0804CC58
	bl EkrDispUP_0804D5B4
	b _08050D40
	.align 2, 0
_08050D34: .4byte 0x0203E010
_08050D38:
	bl EkrGauge_0804CC48
	bl EkrDispUP_0804D5A4
_08050D40:
	bl EfxClearScreenFx
	movs r0, #0
	bl NewEkrUnitKakudai
	movs r0, #0
	bl NewEkrBaseKaiten
	movs r0, #0
	movs r1, #0xb
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #0xb
	movs r2, #0
	bl NewEkrNamewinAppear
	movs r0, #0
	movs r1, #0xb
	bl NewEkrBaseAppear
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ekrBaStart_ExecEkrBattle6C
ekrBaStart_ExecEkrBattle6C: @ 0x08050D7C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08050DBC
	ldr r0, _08050DAC @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08050DA0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08050DB0
_08050DA0:
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_End
	b _08050DBC
	.align 2, 0
_08050DAC: .4byte 0x0203E00A
_08050DB0:
	strh r0, [r4, #0x2c]
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_Break
_08050DBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ekrBaStart_8055FE8
ekrBaStart_8055FE8: @ 0x08050DC4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08050DF8
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08050DF8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ekrBaStart_8056024
ekrBaStart_8056024: @ 0x08050E00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08050E14 @ =0x0203E00E
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050E1C
	ldr r1, _08050E18 @ =0x0201FACC
	movs r0, #6
	b _08050E20
	.align 2, 0
_08050E14: .4byte 0x0203E00E
_08050E18: .4byte 0x0201FACC
_08050E1C:
	ldr r1, _08050E48 @ =0x0201FACC
	movs r0, #0xa
_08050E20:
	str r0, [r1]
	ldr r0, _08050E4C @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl PutBanimBG
	ldr r0, _08050E50 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050E48: .4byte 0x0201FACC
_08050E4C: .4byte 0x0203E00A
_08050E50: .4byte 0x02022860

	thumb_func_start ekrBaStart_8056078
ekrBaStart_8056078: @ 0x08050E54
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _08050EAC @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl PutBanimBgPAL
	ldr r0, _08050EB0 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08050EA2
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08050EA2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050EAC: .4byte 0x0203E00A
_08050EB0: .4byte 0x02022860

	thumb_func_start NewEkrbattleending
NewEkrbattleending: @ 0x08050EB4
	push {lr}
	ldr r0, _08050EC8 @ =0x08B9B04C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
_08050EC8: .4byte 0x08B9B04C

	thumb_func_start sub_08050ECC
sub_08050ECC: @ 0x08050ECC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, _08050EF0 @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08050EE6
	bl CheckInEkrDragon
	adds r6, r0, #0
	cmp r6, #0
	beq _08050EF4
_08050EE6:
	adds r0, r5, #0
	bl Proc_Break
	b _08050F38
	.align 2, 0
_08050EF0: .4byte 0x0203E00A
_08050EF4:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r0, #1
	bl PutBanimBgPAL
	ldr r0, _08050F40 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08050F38
	strh r6, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08050F38:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050F40: .4byte 0x02022860

	thumb_func_start sub_08050F44
sub_08050F44: @ 0x08050F44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08050F64 @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08050F5A
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08050F68
_08050F5A:
	adds r0, r4, #0
	bl Proc_Break
	b _08050F8E
	.align 2, 0
_08050F64: .4byte 0x0203E00A
_08050F68:
	ldr r0, _08050F94 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl ApplyChapterMapGraphics
	movs r0, #0x10
	bl EfxChapterMapFadeOUT
	bl RenderMap
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
_08050F8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050F94: .4byte 0x0202BBF8

	thumb_func_start sub_08050F98
sub_08050F98: @ 0x08050F98
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08050FBC @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08050FB2
	bl CheckInEkrDragon
	adds r5, r0, #0
	cmp r5, #0
	beq _08050FC0
_08050FB2:
	adds r0, r4, #0
	bl Proc_Break
	b _08050FEC
	.align 2, 0
_08050FBC: .4byte 0x0203E00A
_08050FC0:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl EfxChapterMapFadeOUT
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08050FEC
	strh r5, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08050FEC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start ekrBattleEnding_8056228
ekrBattleEnding_8056228: @ 0x08050FF4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _08051050 @ =0x0203E02E
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	bl AnimClearAll
	movs r0, #1
	bl NewEkrUnitKakudai
	movs r0, #1
	bl NewEkrBaseKaiten
	movs r0, #1
	movs r1, #0xb
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #0xb
	bl NewEkrBaseAppear
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051050: .4byte 0x0203E02E

	thumb_func_start sub_08051054
sub_08051054: @ 0x08051054
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _080510D4
	bl EndEkrGauge
	adds r0, r4, #0
	bl Proc_Break
	bl InitBmBgLayers
	ldr r0, _080510DC @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	subs r0, #5
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	orrs r1, r6
	orrs r1, r4
	orrs r1, r3
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2]
_080510D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080510DC: .4byte 0x03002870

	thumb_func_start sub_080510E0
sub_080510E0: @ 0x080510E0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	bl ResetUnitSprites
	bl BMapDispResume_FromBattleDelayed
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	bl ApplyUnitSpritePalettes
	ldr r2, _08051168 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0805116C @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #2
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	beq _08051150
	bl UnpackChapterMapPalette
_08051150:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0805115C
	bl LoadLinkArenaFogPlaceholder
_0805115C:
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051168: .4byte 0x03002870
_0805116C: .4byte 0x0000FFE0

	thumb_func_start sub_08051170
sub_08051170: @ 0x08051170
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	ldrh r1, [r7, #0x2e]
	cmp r0, r1
	beq _08051188
	adds r0, #1
	strh r0, [r7, #0x2c]
_08051188:
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x34
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xa0
	bl Interpolate
	ldr r1, _08051250 @ =0x03002870
	movs r2, #0x2d
	adds r2, r2, r1
	mov sb, r2
	movs r2, #0
	mov r8, r2
	mov r2, sb
	strb r6, [r2]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	mov r0, r8
	str r0, [sp, #4]
	ldr r1, _08051254 @ =0x02023C60
	ldr r2, _08051258 @ =0x01000200
	add r0, sp, #4
	bl CpuFastSet
	movs r0, #4
	bl EnableBgSync
	ldrh r1, [r7, #0x2c]
	ldrh r2, [r7, #0x2e]
	cmp r1, r2
	bne _08051242
	movs r0, #0
	mov r1, r8
	strh r1, [r7, #0x2c]
	mov r2, sb
	strb r0, [r2]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	bl EnablePalSync
	adds r0, r7, #0
	bl Proc_Break
_08051242:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051250: .4byte 0x03002870
_08051254: .4byte 0x02023C60
_08051258: .4byte 0x01000200

	thumb_func_start sub_0805125C
sub_0805125C: @ 0x0805125C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B1D8
	bl RefreshBMapDisplay_FromBattle
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewEkrBaseKaiten
NewEkrBaseKaiten: @ 0x08051274
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r3, _080512DC @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080512E0 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _080512E4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _080512E8 @ =0x0203E02E
	movs r4, #0
	ldrsh r3, [r0, r4]
	movs r1, #4
	ldrsh r2, [r0, r1]
	cmp r3, r2
	bne _080512EC
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r3, #6
	ldrsh r0, [r0, r3]
	movs r4, #2
	cmp r1, r0
	blt _08051318
	movs r4, #6
	b _08051318
	.align 2, 0
_080512DC: .4byte 0x03002870
_080512E0: .4byte 0x0000FFE0
_080512E4: .4byte 0x0000E0FF
_080512E8: .4byte 0x0203E02E
_080512EC:
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r4, #6
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _08051302
	movs r4, #4
	cmp r3, r2
	bge _08051318
	movs r4, #0
	b _08051318
_08051302:
	cmp r3, r2
	bge _08051310
	movs r4, #1
	cmp r1, r0
	blt _08051318
	movs r4, #7
	b _08051318
_08051310:
	movs r4, #3
	cmp r1, r0
	blt _08051318
	movs r4, #5
_08051318:
	ldr r0, _0805132C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt _08051330
	cmp r0, #1
	bge _0805133C
	cmp r0, #0
	beq _08051334
	b _0805133C
	.align 2, 0
_0805132C: .4byte 0x0203E02C
_08051330:
	cmp r0, #4
	bne _0805133C
_08051334:
	ldr r0, _08051338 @ =0x08B9B0B4
	b _0805133E
	.align 2, 0
_08051338: .4byte 0x08B9B0B4
_0805133C:
	ldr r0, _08051370 @ =0x08B9B0D4
_0805133E:
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r1, _08051374 @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _08051378 @ =0x081E7FF8
	ldr r1, _0805137C @ =0x02022AE0
	movs r2, #1
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, _08051380 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bls _08051366
	b _08051642
_08051366:
	lsls r0, r0, #2
	ldr r1, _08051384 @ =_08051388
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051370: .4byte 0x08B9B0D4
_08051374: .4byte 0x06010000
_08051378: .4byte 0x081E7FF8
_0805137C: .4byte 0x02022AE0
_08051380: .4byte 0x0203E02C
_08051384: .4byte _08051388
_08051388: @ jump table
	.4byte _0805139C @ case 0
	.4byte _0805143C @ case 1
	.4byte _0805143C @ case 2
	.4byte _080515A8 @ case 3
	.4byte _0805139C @ case 4
_0805139C:
	ldr r0, _080513EC @ =0x08B9B09C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r2, _080513F0 @ =0x0203E02E
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #4
	ldrsh r1, [r2, r4]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080513F8
	ldr r0, _080513F4 @ =0x08B9B0F4
	b _080513FA
	.align 2, 0
_080513EC: .4byte 0x08B9B09C
_080513F0: .4byte 0x0203E02E
_080513F4: .4byte 0x08B9B0F4
_080513F8:
	ldr r0, _08051428 @ =0x08B9B154
_080513FA:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805142C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051432
	.align 2, 0
_08051428: .4byte 0x08B9B154
_0805142C:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08051432:
	strh r0, [r2, #4]
	ldr r0, _08051438 @ =0x08B9B1B4
	b _08051636
	.align 2, 0
_08051438: .4byte 0x08B9B1B4
_0805143C:
	ldr r0, _08051498 @ =0x08B9B09C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _0805149C @ =0x0203E02E
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r2, #0x48
	strh r2, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _080514A0 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #1
	bne _0805148E
	ldr r1, _080514A4 @ =0x081D85A4
	ldr r0, _080514A8 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_0805148E:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080514B0
	ldr r0, _080514AC @ =0x08B9B114
	b _080514B2
	.align 2, 0
_08051498: .4byte 0x08B9B09C
_0805149C: .4byte 0x0203E02E
_080514A0: .4byte 0x02017744
_080514A4: .4byte 0x081D85A4
_080514A8: .4byte 0x0203E02C
_080514AC: .4byte 0x08B9B114
_080514B0:
	ldr r0, _080514E0 @ =0x08B9B174
_080514B2:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080514E4
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _080514EA
	.align 2, 0
_080514E0: .4byte 0x08B9B174
_080514E4:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_080514EA:
	strh r0, [r2, #4]
	ldr r0, _08051558 @ =0x08B9B1D4
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r4, #0
	strh r4, [r5, #0x3e]
	strh r4, [r5, #0x36]
	ldr r0, _0805155C @ =0x08B9B09C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	strh r4, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _08051560 @ =0x0203E02E
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0xa8
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _08051564 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _0805154C
	ldr r1, _08051568 @ =0x081D85A4
	ldr r0, _0805156C @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0xa8
	strh r0, [r5, #0x34]
_0805154C:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08051574
	ldr r0, _08051570 @ =0x08B9B134
	b _08051576
	.align 2, 0
_08051558: .4byte 0x08B9B1D4
_0805155C: .4byte 0x08B9B09C
_08051560: .4byte 0x0203E02E
_08051564: .4byte 0x02017744
_08051568: .4byte 0x081D85A4
_0805156C: .4byte 0x0203E02C
_08051570: .4byte 0x08B9B134
_08051574:
	ldr r0, _080515A4 @ =0x08B9B194
_08051576:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805162C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051632
	.align 2, 0
_080515A4: .4byte 0x08B9B194
_080515A8:
	ldr r0, _080515EC @ =0x08B9B09C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _080515F0 @ =0x0203E02E
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080515F8
	ldr r0, _080515F4 @ =0x08B9B134
	b _080515FA
	.align 2, 0
_080515EC: .4byte 0x08B9B09C
_080515F0: .4byte 0x0203E02E
_080515F4: .4byte 0x08B9B134
_080515F8:
	ldr r0, _08051628 @ =0x08B9B194
_080515FA:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805162C
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08051632
	.align 2, 0
_08051628: .4byte 0x08B9B194
_0805162C:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08051632:
	strh r0, [r2, #4]
	ldr r0, _08051648 @ =0x08B9B1F4
_08051636:
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x3e]
	strh r0, [r5, #0x36]
_08051642:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051648: .4byte 0x08B9B1F4

	thumb_func_start EkrBaseKaitenMain
EkrBaseKaitenMain: @ 0x0805164C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805166E
	adds r0, r5, #0
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _080516DE
_0805166E:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051698
	movs r3, #0x32
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	b _080516BA
_08051698:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r3, #0x3a
	ldrsh r2, [r4, r3]
_080516BA:
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bgt _080516DE
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
_080516DE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrUnitKakudai
NewEkrUnitKakudai: @ 0x080516E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08051714 @ =0x08B9B214
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x44]
	movs r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #0x4c]
	ldr r0, _08051718 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _08051756
	cmp r0, #3
	ble _0805171C
	cmp r0, #4
	beq _08051744
	b _08051756
	.align 2, 0
_08051714: .4byte 0x08B9B214
_08051718: .4byte 0x0203E02C
_0805171C:
	ldr r0, _08051740 @ =0x0203E010
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	bne _08051730
	bl CheckInEkrDragon
	cmp r0, #0
	bne _08051730
	str r5, [r4, #0x4c]
_08051730:
	ldr r0, _08051740 @ =0x0203E010
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _08051756
	str r0, [r4, #0x50]
	b _08051756
	.align 2, 0
_08051740: .4byte 0x0203E010
_08051744:
	cmp r5, #0
	bne _08051750
	str r1, [r4, #0x4c]
	movs r0, #1
	str r0, [r4, #0x50]
	b _08051756
_08051750:
	movs r0, #1
	str r0, [r4, #0x4c]
	str r1, [r4, #0x50]
_08051756:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start UnitKakudai1
UnitKakudai1: @ 0x0805175C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0805186C @ =0x081D8594
	ldr r0, _08051870 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldr r1, _08051874 @ =0x081D856C
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r6, [r0]
	bl UpdateBanimFrame
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051794
	ldr r1, _08051878 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08051794
	ldr r0, _0805187C @ =0x02022860
	movs r1, #0x17
	movs r2, #1
	bl EfxPalModifyPetrifyEffect
_08051794:
	ldr r5, _08051880 @ =0x0203E010
	ldrh r3, [r5]
	cmp r3, #1
	bne _080517BA
	ldr r0, _08051884 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08051888 @ =0x0200F1C8
	adds r1, r1, r0
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r2, _0805188C @ =0x020041C8
	adds r1, r1, r2
	str r1, [r4, #0x54]
	ldr r1, _08051890 @ =0x02000088
	bl LZ77UnCompWram
_080517BA:
	ldrh r5, [r5, #2]
	cmp r5, #1
	bne _080517DE
	ldr r0, _08051894 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08051898 @ =0x02011BC8
	adds r1, r1, r0
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	ldr r2, _0805189C @ =0x020099C8
	adds r1, r1, r2
	str r1, [r4, #0x58]
	ldr r1, _080518A0 @ =0x02002088
	bl LZ77UnCompWram
_080517DE:
	ldr r5, _080518A4 @ =0x0203E0B0
	ldr r0, [r5]
	cmp r0, #0
	beq _080517EC
	ldr r1, _080518A8 @ =0x02001088
	bl LZ77UnCompWram
_080517EC:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _080517F8
	ldr r1, _080518AC @ =0x02003088
	bl LZ77UnCompWram
_080517F8:
	ldr r1, _080518B0 @ =0x06014000
	ldr r0, _08051890 @ =0x02000088
	movs r2, #0x80
	lsls r2, r2, #7
	bl RegisterDataMove
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xb
	strh r0, [r4, #0x2e]
	ldr r1, _080518B4 @ =0x0203E02E
	movs r5, #0
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3a]
	movs r3, #4
	ldrsh r0, [r1, r3]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x34]
	movs r5, #6
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3c]
	ldr r1, _080518B8 @ =0x081D8599
	ldr r2, _08051870 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r5, [r0]
	strh r5, [r4, #0x36]
	ldr r1, _080518BC @ =0x081D859E
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r3, [r0]
	strh r3, [r4, #0x38]
	ldr r0, _080518C0 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _080518C8
	ldr r0, _080518C4 @ =0x081D85A4
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r1, r3
	strh r0, [r4, #0x38]
	b _080518D8
	.align 2, 0
_0805186C: .4byte 0x081D8594
_08051870: .4byte 0x0203E02C
_08051874: .4byte 0x081D856C
_08051878: .4byte 0x0203A3D8
_0805187C: .4byte 0x02022860
_08051880: .4byte 0x0203E010
_08051884: .4byte 0x0200005C
_08051888: .4byte 0x0200F1C8
_0805188C: .4byte 0x020041C8
_08051890: .4byte 0x02000088
_08051894: .4byte 0x02000060
_08051898: .4byte 0x02011BC8
_0805189C: .4byte 0x020099C8
_080518A0: .4byte 0x02002088
_080518A4: .4byte 0x0203E0B0
_080518A8: .4byte 0x02001088
_080518AC: .4byte 0x02003088
_080518B0: .4byte 0x06014000
_080518B4: .4byte 0x0203E02E
_080518B8: .4byte 0x081D8599
_080518BC: .4byte 0x081D859E
_080518C0: .4byte 0x02017744
_080518C4: .4byte 0x081D85A4
_080518C8:
	ldr r0, _080518E4 @ =0x081D85A4
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r0, r5, r1
	strh r0, [r4, #0x36]
_080518D8:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080518E4: .4byte 0x081D85A4

	thumb_func_start UnitKakudai2
UnitKakudai2: @ 0x080518E8
	push {r4, r5, r6, r7, lr}
	ldr r4, _08051908 @ =0xFFFFFCB4
	add sp, r4
	adds r4, r0, #0
	add r5, sp, #0x304
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _0805190C
	adds r0, r4, #0
	bl Proc_Break
	b _08051A82
	.align 2, 0
_08051908: .4byte 0xFFFFFCB4
_0805190C:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051924
	movs r1, #0x94
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	b _08051930
_08051924:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x94
	lsls r2, r2, #2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
_08051930:
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _080519E2
	ldr r0, [r4, #0x54]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl BanimUpdateSpriteRotScale
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _0805198E
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b _080519BC
_0805198E:
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r6, #0x32
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
_080519BC:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0xe4
	lsls r1, r1, #7
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl AnimDisplay
_080519E2:
	ldr r1, [r4, #0x50]
	cmp r1, #1
	bne _08051A82
	ldr r0, [r4, #0x58]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl BanimUpdateSpriteRotScale
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051A2E
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	movs r6, #0x38
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b _08051A5C
_08051A2E:
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
_08051A5C:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0x93
	lsls r1, r1, #8
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl AnimDisplay
_08051A82:
	movs r3, #0xd3
	lsls r3, r3, #2
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08051A90
sub_08051A90: @ 0x08051A90
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrWindowAppear
NewEkrWindowAppear: @ 0x08051A9C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08051AE0 @ =0x08B9B23C
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r1, #0x39
	strh r1, [r0, #0x30]
	movs r2, #0
	cmp r5, #0
	bne _08051ABE
	movs r2, #0x39
_08051ABE:
	ldr r1, _08051AE4 @ =0x02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC78
	ldr r1, _08051AE8 @ =0x0201FAC0
	movs r0, #1
	str r0, [r1]
	bl EkrGauge_ClrInitFlag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051AE0: .4byte 0x08B9B23C
_08051AE4: .4byte 0x02000038
_08051AE8: .4byte 0x0201FAC0

	thumb_func_start CheckEkrWindowAppearUnexist
CheckEkrWindowAppearUnexist: @ 0x08051AEC
	ldr r0, _08051AF8 @ =0x0201FAC0
	ldr r0, [r0]
	cmp r0, #0
	beq _08051AFC
	movs r0, #0
	b _08051AFE
	.align 2, 0
_08051AF8: .4byte 0x0201FAC0
_08051AFC:
	movs r0, #1
_08051AFE:
	bx lr

	thumb_func_start EkrWindowAppearMain
EkrWindowAppearMain: @ 0x08051B00
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08051B2C
	ldr r1, _08051B28 @ =0x0201FAC0
	movs r0, #0
	str r0, [r1]
	bl EkrGauge_SetInitFlag
	adds r0, r4, #0
	bl Proc_Break
	b _08051B74
	.align 2, 0
_08051B28: .4byte 0x0201FAC0
_08051B2C:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051B4A
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	b _08051B5C
_08051B4A:
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
_08051B5C:
	bl Interpolate
	adds r2, r0, #0
	ldr r1, _08051B7C @ =0x02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC78
_08051B74:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051B7C: .4byte 0x02000038

	thumb_func_start NewEkrNamewinAppear
NewEkrNamewinAppear: @ 0x08051B80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08051BB0 @ =0x08B9B254
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	subs r1, #0x31
	str r1, [r0, #0x48]
	cmp r4, #0
	bne _08051BB4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_SetPositionUnsync
	b _08051BBC
	.align 2, 0
_08051BB0: .4byte 0x08B9B254
_08051BB4:
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_SetPositionUnsync
_08051BBC:
	ldr r1, _08051BCC @ =0x0201FAC4
	movs r0, #1
	str r0, [r1]
	bl UnsyncEkrDispUP
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051BCC: .4byte 0x0201FAC4

	thumb_func_start sub_08051BD0
sub_08051BD0: @ 0x08051BD0
	ldr r0, _08051BDC @ =0x0201FAC4
	ldr r0, [r0]
	cmp r0, #0
	beq _08051BE0
	movs r0, #0
	b _08051BE2
	.align 2, 0
_08051BDC: .4byte 0x0201FAC4
_08051BE0:
	movs r0, #1
_08051BE2:
	bx lr

	thumb_func_start sub_08051BE4
sub_08051BE4: @ 0x08051BE4
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	ldrh r2, [r1, #0x30]
	cmp r0, r2
	bne _08051BFC
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
	b _08051C00
_08051BFC:
	adds r0, #1
	strh r0, [r1, #0x2c]
_08051C00:
	pop {r0}
	bx r0

	thumb_func_start EkrNamewinAppearMain
EkrNamewinAppearMain: @ 0x08051C04
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08051C38
	ldr r0, _08051C34 @ =0x0201FAC4
	movs r1, #0
	str r1, [r0]
	bl SyncEkrDispUP
	ldr r0, [r4, #0x44]
	cmp r0, #2
	bne _08051C2C
	bl EndEkrDispUP
_08051C2C:
	adds r0, r4, #0
	bl Proc_Break
	b _08051C76
	.align 2, 0
_08051C34: .4byte 0x0201FAC4
_08051C38:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051C58
	ldr r1, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b _08051C6C
_08051C58:
	ldr r2, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
_08051C6C:
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_SetPositionUnsync
_08051C76:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewEkrBaseAppear
NewEkrBaseAppear: @ 0x08051C80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08051CA4 @ =0x08B9B274
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	cmp r4, #0
	bne _08051CAC
	ldr r2, _08051CA8 @ =0x0000FFA8
	movs r0, #2
	bl SetBgOffset
	b _08051CB6
	.align 2, 0
_08051CA4: .4byte 0x08B9B274
_08051CA8: .4byte 0x0000FFA8
_08051CAC:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08051CB6:
	ldr r1, _08051CC4 @ =0x0201FAC8
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051CC4: .4byte 0x0201FAC8

	thumb_func_start sub_08051CC8
sub_08051CC8: @ 0x08051CC8
	ldr r0, _08051CD4 @ =0x0201FAC8
	ldr r0, [r0]
	cmp r0, #0
	beq _08051CD8
	movs r0, #0
	b _08051CDA
	.align 2, 0
_08051CD4: .4byte 0x0201FAC8
_08051CD8:
	movs r0, #1
_08051CDA:
	bx lr

	thumb_func_start EkrBaseAppearMain
EkrBaseAppearMain: @ 0x08051CDC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08051D04
	ldr r1, _08051D00 @ =0x0201FAC8
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08051D48
	.align 2, 0
_08051D00: .4byte 0x0201FAC8
_08051D04:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051D26
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b _08051D3C
_08051D26:
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
_08051D3C:
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
_08051D48:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PrepareBattleGraphicsMaybe
PrepareBattleGraphicsMaybe: @ 0x08051D50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	movs r0, #1
	str r0, [sp, #0x20]
	bl ResetEkrDragonStatus
	ldr r1, _08051D78 @ =0x0203A3D8
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08051D7C
	movs r0, #0
	bl sub_080554E4
	b _08051D82
	.align 2, 0
_08051D78: .4byte 0x0203A3D8
_08051D7C:
	movs r0, #1
	bl sub_080554E4
_08051D82:
	ldr r1, _08051D98 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08051D9C
	movs r0, #0
	bl SetBanimLinkArenaFlag
	b _08051DA2
	.align 2, 0
_08051D98: .4byte 0x0202BBB8
_08051D9C:
	movs r0, #1
	bl SetBanimLinkArenaFlag
_08051DA2:
	ldr r1, _08051DBC @ =0x0203A3D8
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _08051DC4
	ldr r1, _08051DC0 @ =0x0203E02C
	movs r0, #4
	strh r0, [r1]
	adds r0, r1, #0
	b _08051DC8
	.align 2, 0
_08051DBC: .4byte 0x0203A3D8
_08051DC0: .4byte 0x0203E02C
_08051DC4:
	ldr r0, _08051DF4 @ =0x0203E02C
	strh r2, [r0]
_08051DC8:
	ldrh r0, [r0]
	cmp r0, #4
	bne _08051E10
	ldr r1, _08051DF8 @ =0x0203E094
	ldr r0, _08051DFC @ =0x0203A3F0
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _08051E00 @ =0x0203E098
	ldr r0, _08051E04 @ =0x0203A470
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _08051E08 @ =0x0203E014
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r0, _08051E0C @ =0x0203E010
	movs r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r7, [sp, #8]
	adds r3, r0, #0
	b _08051F0A
	.align 2, 0
_08051DF4: .4byte 0x0203E02C
_08051DF8: .4byte 0x0203E094
_08051DFC: .4byte 0x0203A3F0
_08051E00: .4byte 0x0203E098
_08051E04: .4byte 0x0203A470
_08051E08: .4byte 0x0203E014
_08051E0C: .4byte 0x0203E010
_08051E10:
	ldr r5, _08051E48 @ =0x0203A3F0
	movs r4, #0x40
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	bl GetAllegienceId
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _08051E4C @ =0x0203A470
	ldrb r0, [r0, #0xb]
	ands r4, r0
	adds r0, r4, #0
	bl GetAllegienceId
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _08051E50 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08051E54
	movs r2, #2
	str r2, [sp, #0x20]
	b _08051E78
	.align 2, 0
_08051E48: .4byte 0x0203A3F0
_08051E4C: .4byte 0x0203A470
_08051E50: .4byte 0x0203A3D8
_08051E54:
	adds r1, r5, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	cmp r0, #0
	bne _08051E64
	movs r3, #2
	str r3, [sp, #0x20]
	b _08051E78
_08051E64:
	ldrh r0, [r1]
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetWeaponAnimActorCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
_08051E78:
	ldr r1, _08051ECC @ =0x0203E010
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _08051EA0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _08051E9E
	cmp r0, #2
	beq _08051E9E
	cmp r0, #1
	bne _08051EA0
	cmp r6, #1
	bne _08051EA0
_08051E9E:
	movs r4, #1
_08051EA0:
	adds r2, r4, #0
	cmp r2, #1
	bne _08051EE4
	ldr r1, _08051ED0 @ =0x0203E094
	ldr r0, _08051ED4 @ =0x0203A470
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _08051ED8 @ =0x0203E098
	ldr r0, _08051EDC @ =0x0203A3F0
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r0, _08051EE0 @ =0x0203E014
	movs r1, #0
	strh r2, [r0]
	strh r1, [r0, #2]
	ldr r7, [sp, #0xc]
	ldr r3, _08051ECC @ =0x0203E010
	ldr r4, [sp, #0x20]
	cmp r4, #1
	bne _08051F0A
	strh r1, [r3]
	b _08051F0A
	.align 2, 0
_08051ECC: .4byte 0x0203E010
_08051ED0: .4byte 0x0203E094
_08051ED4: .4byte 0x0203A470
_08051ED8: .4byte 0x0203E098
_08051EDC: .4byte 0x0203A3F0
_08051EE0: .4byte 0x0203E014
_08051EE4:
	ldr r1, _08051FC0 @ =0x0203E094
	ldr r0, _08051FC4 @ =0x0203A3F0
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _08051FC8 @ =0x0203E098
	ldr r0, _08051FCC @ =0x0203A470
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _08051FD0 @ =0x0203E014
	movs r2, #0
	strh r2, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	ldr r7, [sp, #8]
	ldr r3, _08051FD4 @ =0x0203E010
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _08051F0A
	strh r2, [r3, #2]
_08051F0A:
	ldr r1, [sp, #8]
	mov sl, r1
	ldr r2, [sp, #0xc]
	str r2, [sp, #0x18]
	ldr r4, [r1]
	str r4, [sp, #0x10]
	ldr r0, [r2]
	str r0, [sp, #0x14]
	movs r1, #0
	mov sb, r1
	mov r8, r1
	ldrh r1, [r3, #2]
	ldrh r2, [r3]
	str r2, [sp, #0x1c]
	movs r4, #0
	ldrsh r6, [r3, r4]
	cmp r6, #0
	beq _08051F36
	mov r2, sl
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x34]
	mov r8, r0
_08051F36:
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	str r0, [sp, #0x28]
	cmp r5, #0
	beq _08051F48
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #4]
	ldr r0, [r0, #0x34]
	mov sb, r0
_08051F48:
	cmp r6, #0
	beq _08051F74
	ldr r3, _08051FD8 @ =0x0203E02E
	mov r4, sl
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	ldr r2, _08051FDC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3]
	mov r1, sl
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #2]
_08051F74:
	cmp r5, #0
	beq _08051FA0
	ldr r3, _08051FD8 @ =0x0203E02E
	ldr r1, [sp, #0x18]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _08051FDC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #4]
	ldr r1, [sp, #0x18]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #6]
_08051FA0:
	ldr r4, _08051FE0 @ =0x0203E02C
	ldrh r0, [r4]
	cmp r0, #4
	beq _0805206E
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08051FE4
	movs r0, #2
	strh r0, [r4]
	b _08052066
	.align 2, 0
_08051FC0: .4byte 0x0203E094
_08051FC4: .4byte 0x0203A3F0
_08051FC8: .4byte 0x0203E098
_08051FCC: .4byte 0x0203A470
_08051FD0: .4byte 0x0203E014
_08051FD4: .4byte 0x0203E010
_08051FD8: .4byte 0x0203E02E
_08051FDC: .4byte 0x0202BBB8
_08051FE0: .4byte 0x0203E02C
_08051FE4:
	movs r0, #3
	strh r0, [r4]
	adds r0, r6, r5
	cmp r0, #2
	bne _08052066
	ldr r0, _08052008 @ =0x0203E02E
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #4
	ldrsh r2, [r0, r3]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0
	blt _0805200C
	ldrh r4, [r2]
	ldrh r1, [r2, #4]
	subs r0, r4, r1
	b _08052012
	.align 2, 0
_08052008: .4byte 0x0203E02E
_0805200C:
	ldrh r3, [r2, #4]
	ldrh r4, [r2]
	subs r0, r3, r4
_08052012:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r4, #6
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	cmp r0, #0
	blt _0805202C
	ldrh r1, [r2, #2]
	ldrh r4, [r2, #6]
	b _08052030
_0805202C:
	ldrh r1, [r2, #6]
	ldrh r4, [r2, #2]
_08052030:
	subs r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r1, r0
	cmp r0, #1
	bgt _08052050
	ldr r1, _0805204C @ =0x0203E02C
	movs r0, #0
	b _08052064
	.align 2, 0
_0805204C: .4byte 0x0203E02C
_08052050:
	cmp r0, #3
	bgt _08052060
	ldr r1, _0805205C @ =0x0203E02C
	movs r0, #1
	b _08052064
	.align 2, 0
_0805205C: .4byte 0x0203E02C
_08052060:
	ldr r1, _080520A4 @ =0x0203E02C
	movs r0, #2
_08052064:
	strh r0, [r1]
_08052066:
	ldr r0, _080520A4 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _080520B0
_0805206E:
	ldr r0, [sp, #8]
	adds r0, #0x48
	ldrh r2, [r0]
	mov r0, sl
	mov r1, r8
	mov r3, sp
	bl GetBattleAnimationId_WithUnique
	ldr r5, _080520A8 @ =0x0203E08E
	ldr r4, _080520AC @ =0x0203E018
	strh r0, [r4]
	strh r0, [r5]
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	ldrh r2, [r0]
	add r3, sp, #4
	ldr r0, [sp, #0x18]
	mov r1, sb
	bl GetBattleAnimationId_WithUnique
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	str r0, [sp, #0x24]
	b _080520F0
	.align 2, 0
_080520A4: .4byte 0x0203E02C
_080520A8: .4byte 0x0203E08E
_080520AC: .4byte 0x0203E018
_080520B0:
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #0x10
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _080520D2
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r2, [r0]
	mov r0, sl
	mov r1, r8
	mov r3, sp
	bl GetBattleAnimationId_WithUnique
	ldr r2, _0805223C @ =0x0203E08E
	ldr r1, _08052240 @ =0x0203E018
	strh r0, [r1]
	strh r0, [r2]
_080520D2:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	beq _080520F0
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r2, [r0]
	add r3, sp, #4
	ldr r0, [sp, #0x18]
	mov r1, sb
	bl GetBattleAnimationId_WithUnique
	ldr r2, _0805223C @ =0x0203E08E
	ldr r1, _08052240 @ =0x0203E018
	strh r0, [r1, #2]
	strh r0, [r2, #2]
_080520F0:
	ldr r3, [sp, #0x24]
	asrs r7, r3, #0x10
	cmp r7, #0
	beq _08052104
	ldr r1, [sp]
	mov r0, sl
	bl GetBattleAnimCharacterUniquePalIndex
	ldr r1, _08052244 @ =0x0203E01C
	strh r0, [r1]
_08052104:
	ldr r4, [sp, #0x28]
	asrs r4, r4, #0x10
	mov r8, r4
	cmp r4, #0
	beq _0805211A
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x18]
	bl GetBattleAnimCharacterUniquePalIndex
	ldr r1, _08052244 @ =0x0203E01C
	strh r0, [r1, #2]
_0805211A:
	cmp r7, #0
	beq _08052132
	ldr r0, _0805223C @ =0x0203E08E
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl FilterBattleAnimCharacterPalette
	ldr r1, _08052248 @ =0x0203E0A8
	str r0, [r1]
_08052132:
	mov r2, r8
	cmp r2, #0
	beq _0805214C
	ldr r0, _0805223C @ =0x0203E08E
	movs r3, #2
	ldrsh r0, [r0, r3]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl FilterBattleAnimCharacterPalette
	ldr r1, _08052248 @ =0x0203E0A8
	str r0, [r1, #4]
_0805214C:
	ldr r4, _0805224C @ =0x0203E0D8
	mov sb, r4
	ldr r2, [sp, #8]
	adds r2, #0x55
	ldrb r0, [r2]
	strh r0, [r4]
	ldr r6, [sp, #0xc]
	adds r6, #0x55
	ldrb r0, [r6]
	strh r0, [r4, #2]
	ldr r5, _08052250 @ =0x0203E028
	ldr r1, _08052254 @ =0x0000FFFF
	adds r0, r1, #0
	ldrh r1, [r5, #2]
	orrs r1, r0
	strh r1, [r5, #2]
	ldrh r3, [r5]
	orrs r0, r3
	strh r0, [r5]
	cmp r7, #0
	beq _0805218E
	ldrb r4, [r2]
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r5]
_0805218E:
	mov r4, r8
	cmp r4, #0
	beq _080521AC
	ldrb r4, [r6]
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r5, #2]
_080521AC:
	ldr r1, _0805225C @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080521FA
	movs r0, #0x30
	mov r1, sb
	strh r0, [r1]
	strh r0, [r1, #2]
	cmp r7, #0
	beq _080521DA
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	movs r0, #0x30
	bl GetBanimTerrainGround
	strh r0, [r5]
_080521DA:
	mov r2, r8
	cmp r2, #0
	beq _080521FA
	mov r3, sb
	ldrh r4, [r3, #2]
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl GetBanimTerrainGround
	strh r0, [r5, #2]
_080521FA:
	bl CheckBanimHensei
	cmp r0, #1
	bne _08052212
	ldr r1, _08052250 @ =0x0203E028
	movs r0, #0x14
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r1, _0805224C @ =0x0203E0D8
	movs r0, #0x30
	strh r0, [r1, #2]
	strh r0, [r1]
_08052212:
	ldr r0, _08052260 @ =0x0203E02C
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	blt _0805222A
	cmp r0, #3
	ble _0805222A
	cmp r0, #4
	bne _0805222A
	ldr r1, _08052250 @ =0x0203E028
	ldrh r0, [r1, #2]
	strh r0, [r1]
_0805222A:
	ldr r0, _08052258 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #2
	bgt _08052268
	cmp r0, #1
	blt _08052268
	ldr r1, _08052264 @ =0x0203E00E
	movs r0, #1
	b _0805226C
	.align 2, 0
_0805223C: .4byte 0x0203E08E
_08052240: .4byte 0x0203E018
_08052244: .4byte 0x0203E01C
_08052248: .4byte 0x0203E0A8
_0805224C: .4byte 0x0203E0D8
_08052250: .4byte 0x0203E028
_08052254: .4byte 0x0000FFFF
_08052258: .4byte 0x0202BBF8
_0805225C: .4byte 0x0202BBB8
_08052260: .4byte 0x0203E02C
_08052264: .4byte 0x0203E00E
_08052268:
	ldr r1, _080522E8 @ =0x0203E00E
	movs r0, #0
_0805226C:
	strh r0, [r1]
	ldr r0, [sp, #0x24]
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _08052284
	ldr r0, _080522EC @ =0x0203E0DC
	mov r2, sl
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0]
_08052284:
	ldr r3, [sp, #0x28]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq _0805229A
	ldr r0, _080522EC @ =0x0203E0DC
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #2]
_0805229A:
	cmp r4, #0
	beq _080522B6
	ldr r1, _080522F0 @ =0x0203E0B8
	ldr r0, [sp, #8]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	ldr r1, _080522F4 @ =0x0203E0BC
	mov r3, sl
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r1]
_080522B6:
	cmp r5, #0
	beq _080522D2
	ldr r1, _080522F0 @ =0x0203E0B8
	ldr r0, [sp, #0xc]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
	ldr r1, _080522F4 @ =0x0203E0BC
	ldr r2, [sp, #0x18]
	movs r0, #0x12
	ldrsb r0, [r2, r0]
	strh r0, [r1, #2]
_080522D2:
	bl ParseBattleHitToBanimCmd
	ldr r0, _080522F8 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _08052300
	ldr r1, _080522FC @ =0x0203E024
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _0805236C
	.align 2, 0
_080522E8: .4byte 0x0203E00E
_080522EC: .4byte 0x0203E0DC
_080522F0: .4byte 0x0203E0B8
_080522F4: .4byte 0x0203E0BC
_080522F8: .4byte 0x0203E02C
_080522FC: .4byte 0x0203E024
_08052300:
	cmp r4, #0
	beq _08052318
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_08052B08
	ldr r1, _080525C0 @ =0x0203E024
	strh r0, [r1]
_08052318:
	cmp r5, #0
	beq _08052330
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl sub_08052B08
	ldr r1, _080525C0 @ =0x0203E024
	strh r0, [r1, #2]
_08052330:
	ldr r1, _080525C4 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0805236C
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805236C
	ldr r1, [sp, #0x18]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x41
	bne _0805235C
	ldr r1, _080525C0 @ =0x0203E024
	movs r0, #0xe
	strh r0, [r1, #2]
_0805235C:
	ldr r2, [sp, #0x18]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	bne _0805236C
	ldr r1, _080525C0 @ =0x0203E024
	movs r0, #0xf
	strh r0, [r1, #2]
_0805236C:
	ldr r3, [sp, #0x24]
	cmp r3, #0
	beq _08052380
	ldr r0, _080525C0 @ =0x0203E024
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	bl sub_08052C50
_08052380:
	ldr r4, [sp, #0x28]
	cmp r4, #0
	beq _08052394
	ldr r0, _080525C8 @ =0x0203E026
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #1
	bl sub_08052C50
_08052394:
	ldr r0, _080525CC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _080523B0
	cmp r0, #2
	bgt _080523B0
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	bne _080523B0
	bl sub_08064A2C
_080523B0:
	ldr r3, [sp, #0x24]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq _080523CA
	movs r0, #0x40
	rsbs r0, r0, #0
	mov r4, sl
	ldrb r4, [r4, #0xb]
	ands r0, r4
	bl GetAllegienceId
	ldr r1, _080525D0 @ =0x0203E020
	strh r0, [r1]
_080523CA:
	ldr r0, [sp, #0x28]
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _080523E4
	movs r0, #0x40
	rsbs r0, r0, #0
	ldr r1, [sp, #0x18]
	ldrb r1, [r1, #0xb]
	ands r0, r1
	bl GetAllegienceId
	ldr r1, _080525D0 @ =0x0203E020
	strh r0, [r1, #2]
_080523E4:
	ldr r1, _080525D4 @ =0x0203E09C
	movs r3, #0
	strb r3, [r1, #1]
	strb r3, [r1]
	cmp r5, #0
	beq _080523F6
	ldr r2, [sp, #0x10]
	ldrb r0, [r2, #4]
	strb r0, [r1]
_080523F6:
	cmp r4, #0
	beq _08052400
	ldr r2, [sp, #0x14]
	ldrb r0, [r2, #4]
	strb r0, [r1, #1]
_08052400:
	ldr r0, _080525D8 @ =0x0203E0C4
	mov r8, r0
	cmp r5, #0
	beq _08052412
	ldr r0, [sp, #8]
	adds r0, #0x64
	ldrh r0, [r0]
	mov r1, r8
	strh r0, [r1]
_08052412:
	cmp r4, #0
	beq _08052420
	ldr r0, [sp, #0xc]
	adds r0, #0x64
	ldrh r0, [r0]
	mov r2, r8
	strh r0, [r2, #2]
_08052420:
	mov r4, r8
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0xff
	bne _0805242E
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r4]
_0805242E:
	mov r2, r8
	ldrh r0, [r2, #2]
	adds r4, r0, #0
	cmp r4, #0xff
	bne _0805243C
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r2, #2]
_0805243C:
	cmp r5, #0
	beq _08052464
	ldr r2, _080525E0 @ =0x0203E0C8
	ldr r1, [sp, #8]
	adds r1, #0x5a
	ldr r0, [sp, #0xc]
	adds r0, #0x5c
	ldrh r4, [r1]
	ldrh r0, [r0]
	subs r0, r4, r0
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0805245A
	strh r3, [r2]
_0805245A:
	ldrh r1, [r1]
	cmp r1, #0xff
	bne _08052464
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r2]
_08052464:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _08052490
	ldr r2, _080525E0 @ =0x0203E0C8
	ldr r1, [sp, #0xc]
	adds r1, #0x5a
	ldr r0, [sp, #8]
	adds r0, #0x5c
	ldrh r3, [r1]
	ldrh r0, [r0]
	subs r0, r3, r0
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08052486
	movs r0, #0
	strh r0, [r2, #2]
_08052486:
	ldrh r1, [r1]
	cmp r1, #0xff
	bne _08052490
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r2, #2]
_08052490:
	ldr r4, [sp, #0x24]
	asrs r7, r4, #0x10
	ldr r3, _080525E4 @ =0x0203E0CC
	cmp r7, #0
	beq _080524A2
	ldr r0, [sp, #8]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r3]
_080524A2:
	ldr r0, [sp, #0x28]
	asrs r6, r0, #0x10
	cmp r6, #0
	beq _080524B2
	ldr r0, [sp, #0xc]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r3, #2]
_080524B2:
	adds r1, r3, #0
	ldrh r0, [r1]
	cmp r0, #0xff
	bne _080524BE
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r1]
_080524BE:
	ldrh r0, [r1, #2]
	cmp r0, #0xff
	bne _080524C8
	ldr r0, _080525DC @ =0x0000FFFF
	strh r0, [r1, #2]
_080524C8:
	ldr r0, _080525CC @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _080524EA
	ldr r2, _080525DC @ =0x0000FFFF
	adds r1, r2, #0
	mov r4, r8
	ldrh r0, [r4, #2]
	orrs r0, r1
	strh r0, [r4, #2]
	ldr r2, _080525E0 @ =0x0203E0C8
	ldrh r0, [r2, #2]
	orrs r0, r1
	strh r0, [r2, #2]
	ldrh r0, [r3, #2]
	orrs r1, r0
	strh r1, [r3, #2]
_080524EA:
	cmp r7, #0
	beq _080524FC
	ldr r1, _080525E8 @ =0x0203E0D0
	ldr r0, [sp, #8]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_080524FC:
	cmp r6, #0
	beq _0805250E
	ldr r1, _080525E8 @ =0x0203E0D0
	ldr r0, [sp, #0xc]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_0805250E:
	cmp r7, #0
	beq _08052520
	ldr r1, _080525EC @ =0x0203E0D4
	ldr r0, [sp, #8]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08052520:
	cmp r6, #0
	beq _08052532
	ldr r1, _080525EC @ =0x0203E0D4
	ldr r0, [sp, #0xc]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08052532:
	ldr r1, _080525F0 @ =0x0203E0E0
	movs r5, #0
	strh r5, [r1, #2]
	strh r5, [r1]
	cmp r7, #0
	beq _0805254A
	ldr r0, [sp, #8]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_0805254A:
	cmp r6, #0
	beq _0805255A
	ldr r0, [sp, #0xc]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_0805255A:
	ldr r4, _080525F4 @ =0x0203E0E4
	strh r5, [r4, #2]
	strh r5, [r4]
	cmp r7, #0
	beq _08052576
	ldr r0, [sp, #8]
	adds r0, #0x48
	ldrh r0, [r0]
	ldr r1, [sp, #0x18]
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
_08052576:
	cmp r6, #0
	beq _0805258C
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	ldrh r0, [r0]
	mov r1, sl
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
_0805258C:
	ldr r4, _080525F8 @ =0x0203E0B0
	str r5, [r4, #4]
	str r5, [r4]
	cmp r7, #0
	beq _08052610
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x36
	bgt _08052610
	cmp r0, #0x34
	blt _08052610
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x19
	beq _080525FC
	cmp r0, #0x19
	ble _08052610
	cmp r0, #0x1a
	beq _08052604
	cmp r0, #0x1b
	beq _0805260C
	b _08052610
	.align 2, 0
_080525C0: .4byte 0x0203E024
_080525C4: .4byte 0x0203A3D8
_080525C8: .4byte 0x0203E026
_080525CC: .4byte 0x0203E02C
_080525D0: .4byte 0x0203E020
_080525D4: .4byte 0x0203E09C
_080525D8: .4byte 0x0203E0C4
_080525DC: .4byte 0x0000FFFF
_080525E0: .4byte 0x0203E0C8
_080525E4: .4byte 0x0203E0CC
_080525E8: .4byte 0x0203E0D0
_080525EC: .4byte 0x0203E0D4
_080525F0: .4byte 0x0203E0E0
_080525F4: .4byte 0x0203E0E4
_080525F8: .4byte 0x0203E0B0
_080525FC:
	ldr r0, _08052600 @ =0x081DA264
	b _0805260E
	.align 2, 0
_08052600: .4byte 0x081DA264
_08052604:
	ldr r0, _08052608 @ =0x081DA6D8
	b _0805260E
	.align 2, 0
_08052608: .4byte 0x081DA6D8
_0805260C:
	ldr r0, _08052640 @ =0x081DAB78
_0805260E:
	str r0, [r4]
_08052610:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	beq _0805266A
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x36
	bgt _0805266A
	cmp r0, #0x34
	blt _0805266A
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x19
	beq _08052644
	cmp r0, #0x19
	ble _0805266A
	cmp r0, #0x1a
	beq _08052654
	cmp r0, #0x1b
	beq _08052664
	b _0805266A
	.align 2, 0
_08052640: .4byte 0x081DAB78
_08052644:
	ldr r1, _0805264C @ =0x0203E0B0
	ldr r0, _08052650 @ =0x081DA264
	b _08052668
	.align 2, 0
_0805264C: .4byte 0x0203E0B0
_08052650: .4byte 0x081DA264
_08052654:
	ldr r1, _0805265C @ =0x0203E0B0
	ldr r0, _08052660 @ =0x081DA6D8
	b _08052668
	.align 2, 0
_0805265C: .4byte 0x0203E0B0
_08052660: .4byte 0x081DA6D8
_08052664:
	ldr r1, _08052684 @ =0x0203E0B0
	ldr r0, _08052688 @ =0x081DAB78
_08052668:
	str r0, [r1, #4]
_0805266A:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _0805267E
	ldr r0, _0805268C @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08052694
_0805267E:
	ldr r1, _08052690 @ =0x0203E0E8
	movs r0, #1
	b _08052698
	.align 2, 0
_08052684: .4byte 0x0203E0B0
_08052688: .4byte 0x081DAB78
_0805268C: .4byte 0x0202BBF8
_08052690: .4byte 0x0203E0E8
_08052694:
	ldr r1, _080526BC @ =0x0203E0E8
	movs r0, #0
_08052698:
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r5, _080526C0 @ =0x0203E00A
	movs r0, #0
	strh r0, [r5]
	bl GetBattleAnimKind
	cmp r0, #3
	bne _080526E6
	ldr r0, _080526C4 @ =0x0203E010
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	beq _080526CC
	ldr r0, _080526C8 @ =0x0203E0D8
	ldrh r4, [r0]
	b _080526D0
	.align 2, 0
_080526BC: .4byte 0x0203E0E8
_080526C0: .4byte 0x0203E00A
_080526C4: .4byte 0x0203E010
_080526C8: .4byte 0x0203E0D8
_080526CC:
	ldr r0, _08052824 @ =0x0203E0D8
	ldrh r4, [r0, #2]
_080526D0:
	ldr r0, _08052828 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_08052A30
	strh r0, [r5]
_080526E6:
	bl CheckBanimHensei
	cmp r0, #1
	bne _080526F4
	ldr r1, _0805282C @ =0x0203E00A
	movs r0, #0x3c
	strh r0, [r1]
_080526F4:
	movs r4, #0
	bl GetBattleAnimKind
	cmp r0, #0
	bne _08052700
	movs r4, #1
_08052700:
	bl GetBattleAnimKind
	cmp r0, #3
	bne _0805270A
	movs r4, #1
_0805270A:
	bl GetBattleAnimKind
	cmp r0, #1
	bne _08052740
	ldr r0, _08052830 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _0805271C
	movs r4, #1
_0805271C:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08052726
	movs r4, #1
_08052726:
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	bne _08052732
	movs r4, #1
_08052732:
	bl CheckBattleScriptted
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08052740
	movs r4, #1
_08052740:
	bl SetBattleUnscriptted
	ldr r0, _08052830 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	beq _08052778
	mov r2, sl
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08052820
	ldr r3, [sp, #0x18]
	ldr r0, [r3, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _08052820
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _08052820
	ldr r2, [sp, #0x18]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	beq _08052820
_08052778:
	ldr r3, [sp, #0x20]
	cmp r3, #1
	beq _08052788
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x46
	beq _08052844
_08052788:
	cmp r4, #0
	beq _08052820
	ldr r0, _08052834 @ =0x0203E010
	adds r3, r0, #0
	ldrh r2, [r3]
	cmp r2, #1
	bne _080527D8
	mov r1, sl
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08052820
	ldr r0, _08052838 @ =0x0203E08E
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _08052820
	ldr r0, _0805283C @ =0x0203E024
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08052820
	ldr r0, _08052840 @ =0x0203E028
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r2
	beq _08052820
	ldr r0, _08052824 @ =0x0203E0D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x1b
	beq _08052820
	cmp r0, #0x33
	beq _08052820
_080527D8:
	ldrh r3, [r3, #2]
	cmp r3, #1
	bne _08052844
	ldr r1, [sp, #0x18]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08052820
	ldr r0, _08052838 @ =0x0203E08E
	movs r3, #2
	ldrsh r0, [r0, r3]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _08052820
	ldr r0, _0805283C @ =0x0203E024
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08052820
	ldr r0, _08052840 @ =0x0203E028
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, r2
	beq _08052820
	ldr r0, _08052824 @ =0x0203E0D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x1b
	beq _08052820
	cmp r0, #0x33
	bne _08052844
_08052820:
	movs r0, #0
	b _08052846
	.align 2, 0
_08052824: .4byte 0x0203E0D8
_08052828: .4byte 0x0202BBF8
_0805282C: .4byte 0x0203E00A
_08052830: .4byte 0x0203E02C
_08052834: .4byte 0x0203E010
_08052838: .4byte 0x0203E08E
_0805283C: .4byte 0x0203E024
_08052840: .4byte 0x0203E028
_08052844:
	movs r0, #1
_08052846:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetBattleAnimationId_WithUnique
GetBattleAnimationId_WithUnique: @ 0x08052858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	mov sb, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq _0805288E
	mov r0, r8
	bl GetItemKind
	cmp r0, #9
	bne _08052898
	mov r0, r8
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08052898
_0805288E:
	ldr r0, _08052894 @ =0x0000FFFF
	b _08052944
	.align 2, 0
_08052894: .4byte 0x0000FFFF
_08052898:
	mov r1, r8
	cmp r1, #0
	bne _080528A2
	movs r3, #9
	b _080528AC
_080528A2:
	mov r0, r8
	bl GetItemKind
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080528AC:
	str r4, [sp]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x25
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080528D2
	ldr r1, _080528E4 @ =0x08C996B4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
_080528D2:
	movs r0, #0
	mov r2, sb
	str r0, [r2]
	movs r7, #0
	movs r1, #0
_080528DC:
	ldr r5, [sp]
	movs r6, #0
	b _0805292C
	.align 2, 0
_080528E4: .4byte 0x08C996B4
_080528E8:
	cmp r7, #0
	bne _080528F0
	cmp r0, #0xff
	bhi _08052928
_080528F0:
	cmp r7, #1
	bne _080528FA
	ldrh r4, [r5]
	cmp r4, #0xff
	bls _08052928
_080528FA:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r3, [sp, #8]
	bl GetItemIid
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	cmp r4, r0
	beq _08052918
	ldrh r2, [r5]
	ldr r4, _08052924 @ =0xFFFFFF00
	adds r0, r2, r4
	cmp r0, r3
	bne _08052928
_08052918:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, sb
	str r6, [r0]
	movs r1, #1
	b _08052932
	.align 2, 0
_08052924: .4byte 0xFFFFFF00
_08052928:
	adds r5, #4
	adds r6, #1
_0805292C:
	ldrh r0, [r5]
	cmp r0, #0
	bne _080528E8
_08052932:
	cmp r1, #1
	beq _0805293C
	adds r7, #1
	cmp r7, #1
	ble _080528DC
_0805293C:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08052944:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start GetBanimTerrainGround
GetBanimTerrainGround: @ 0x08052954
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xe
	bhi _08052A1C
	lsls r0, r0, #2
	ldr r1, _0805296C @ =_08052970
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805296C: .4byte _08052970
_08052970: @ jump table
	.4byte _08052A1C @ case 0
	.4byte _080529AC @ case 1
	.4byte _080529B4 @ case 2
	.4byte _080529BC @ case 3
	.4byte _080529C4 @ case 4
	.4byte _080529CC @ case 5
	.4byte _080529D4 @ case 6
	.4byte _080529DC @ case 7
	.4byte _080529E4 @ case 8
	.4byte _080529EC @ case 9
	.4byte _080529F4 @ case 10
	.4byte _080529FC @ case 11
	.4byte _08052A04 @ case 12
	.4byte _08052A0C @ case 13
	.4byte _08052A14 @ case 14
_080529AC:
	ldr r0, _080529B0 @ =0x08BE4887
	b _08052A1E
	.align 2, 0
_080529B0: .4byte 0x08BE4887
_080529B4:
	ldr r0, _080529B8 @ =0x08BE48C8
	b _08052A1E
	.align 2, 0
_080529B8: .4byte 0x08BE48C8
_080529BC:
	ldr r0, _080529C0 @ =0x08BE4909
	b _08052A1E
	.align 2, 0
_080529C0: .4byte 0x08BE4909
_080529C4:
	ldr r0, _080529C8 @ =0x08BE494A
	b _08052A1E
	.align 2, 0
_080529C8: .4byte 0x08BE494A
_080529CC:
	ldr r0, _080529D0 @ =0x08BE498B
	b _08052A1E
	.align 2, 0
_080529D0: .4byte 0x08BE498B
_080529D4:
	ldr r0, _080529D8 @ =0x08BE49CC
	b _08052A1E
	.align 2, 0
_080529D8: .4byte 0x08BE49CC
_080529DC:
	ldr r0, _080529E0 @ =0x08BE4A0D
	b _08052A1E
	.align 2, 0
_080529E0: .4byte 0x08BE4A0D
_080529E4:
	ldr r0, _080529E8 @ =0x08BE4A4E
	b _08052A1E
	.align 2, 0
_080529E8: .4byte 0x08BE4A4E
_080529EC:
	ldr r0, _080529F0 @ =0x08BE4A8F
	b _08052A1E
	.align 2, 0
_080529F0: .4byte 0x08BE4A8F
_080529F4:
	ldr r0, _080529F8 @ =0x08BE4AD0
	b _08052A1E
	.align 2, 0
_080529F8: .4byte 0x08BE4AD0
_080529FC:
	ldr r0, _08052A00 @ =0x08BE4B11
	b _08052A1E
	.align 2, 0
_08052A00: .4byte 0x08BE4B11
_08052A04:
	ldr r0, _08052A08 @ =0x08BE4B52
	b _08052A1E
	.align 2, 0
_08052A08: .4byte 0x08BE4B52
_08052A0C:
	ldr r0, _08052A10 @ =0x08BE4B93
	b _08052A1E
	.align 2, 0
_08052A10: .4byte 0x08BE4B93
_08052A14:
	ldr r0, _08052A18 @ =0x08BE4BD4
	b _08052A1E
	.align 2, 0
_08052A18: .4byte 0x08BE4BD4
_08052A1C:
	ldr r0, _08052A2C @ =0x08BE4846
_08052A1E:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	bx lr
	.align 2, 0
_08052A2C: .4byte 0x08BE4846

	thumb_func_start sub_08052A30
sub_08052A30: @ 0x08052A30
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xe
	bhi _08052AF8
	lsls r0, r0, #2
	ldr r1, _08052A48 @ =_08052A4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052A48: .4byte _08052A4C
_08052A4C: @ jump table
	.4byte _08052AF8 @ case 0
	.4byte _08052A88 @ case 1
	.4byte _08052A90 @ case 2
	.4byte _08052A98 @ case 3
	.4byte _08052AA0 @ case 4
	.4byte _08052AA8 @ case 5
	.4byte _08052AB0 @ case 6
	.4byte _08052AB8 @ case 7
	.4byte _08052AC0 @ case 8
	.4byte _08052AC8 @ case 9
	.4byte _08052AD0 @ case 10
	.4byte _08052AD8 @ case 11
	.4byte _08052AE0 @ case 12
	.4byte _08052AE8 @ case 13
	.4byte _08052AF0 @ case 14
_08052A88:
	ldr r0, _08052A8C @ =0x08BE4C56
	b _08052AFA
	.align 2, 0
_08052A8C: .4byte 0x08BE4C56
_08052A90:
	ldr r0, _08052A94 @ =0x08BE4C97
	b _08052AFA
	.align 2, 0
_08052A94: .4byte 0x08BE4C97
_08052A98:
	ldr r0, _08052A9C @ =0x08BE4CD8
	b _08052AFA
	.align 2, 0
_08052A9C: .4byte 0x08BE4CD8
_08052AA0:
	ldr r0, _08052AA4 @ =0x08BE4D19
	b _08052AFA
	.align 2, 0
_08052AA4: .4byte 0x08BE4D19
_08052AA8:
	ldr r0, _08052AAC @ =0x08BE4D5A
	b _08052AFA
	.align 2, 0
_08052AAC: .4byte 0x08BE4D5A
_08052AB0:
	ldr r0, _08052AB4 @ =0x08BE4D9B
	b _08052AFA
	.align 2, 0
_08052AB4: .4byte 0x08BE4D9B
_08052AB8:
	ldr r0, _08052ABC @ =0x08BE4DDC
	b _08052AFA
	.align 2, 0
_08052ABC: .4byte 0x08BE4DDC
_08052AC0:
	ldr r0, _08052AC4 @ =0x08BE4E1D
	b _08052AFA
	.align 2, 0
_08052AC4: .4byte 0x08BE4E1D
_08052AC8:
	ldr r0, _08052ACC @ =0x08BE4E5E
	b _08052AFA
	.align 2, 0
_08052ACC: .4byte 0x08BE4E5E
_08052AD0:
	ldr r0, _08052AD4 @ =0x08BE4E9F
	b _08052AFA
	.align 2, 0
_08052AD4: .4byte 0x08BE4E9F
_08052AD8:
	ldr r0, _08052ADC @ =0x08BE4EE0
	b _08052AFA
	.align 2, 0
_08052ADC: .4byte 0x08BE4EE0
_08052AE0:
	ldr r0, _08052AE4 @ =0x08BE4F21
	b _08052AFA
	.align 2, 0
_08052AE4: .4byte 0x08BE4F21
_08052AE8:
	ldr r0, _08052AEC @ =0x08BE4F62
	b _08052AFA
	.align 2, 0
_08052AEC: .4byte 0x08BE4F62
_08052AF0:
	ldr r0, _08052AF4 @ =0x08BE4FA3
	b _08052AFA
	.align 2, 0
_08052AF4: .4byte 0x08BE4FA3
_08052AF8:
	ldr r0, _08052B04 @ =0x08BE4C15
_08052AFA:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08052B04: .4byte 0x08BE4C15

	thumb_func_start sub_08052B08
sub_08052B08: @ 0x08052B08
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _08052B24 @ =0x08C999C0
	ldrh r1, [r3]
	ldr r2, _08052B28 @ =0x0000FFFF
	b _08052B30
	.align 2, 0
_08052B24: .4byte 0x08C999C0
_08052B28: .4byte 0x0000FFFF
_08052B2C:
	adds r3, #0x10
	ldrh r1, [r3]
_08052B30:
	cmp r1, r2
	beq _08052B38
	cmp r1, r0
	bne _08052B2C
_08052B38:
	ldrh r2, [r3, #4]
	ldrh r3, [r3, #4]
	cmp r3, #3
	beq _08052B42
	b _08052C46
_08052B42:
	subs r0, r4, #7
	cmp r0, #0x31
	bls _08052B4A
	b _08052C46
_08052B4A:
	lsls r0, r0, #2
	ldr r1, _08052B54 @ =_08052B58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052B54: .4byte _08052B58
_08052B58: @ jump table
	.4byte _08052C28 @ case 0
	.4byte _08052C46 @ case 1
	.4byte _08052C46 @ case 2
	.4byte _08052C46 @ case 3
	.4byte _08052C46 @ case 4
	.4byte _08052C46 @ case 5
	.4byte _08052C46 @ case 6
	.4byte _08052C46 @ case 7
	.4byte _08052C46 @ case 8
	.4byte _08052C46 @ case 9
	.4byte _08052C46 @ case 10
	.4byte _08052C46 @ case 11
	.4byte _08052C46 @ case 12
	.4byte _08052C46 @ case 13
	.4byte _08052C46 @ case 14
	.4byte _08052C44 @ case 15
	.4byte _08052C44 @ case 16
	.4byte _08052C46 @ case 17
	.4byte _08052C46 @ case 18
	.4byte _08052C46 @ case 19
	.4byte _08052C46 @ case 20
	.4byte _08052C46 @ case 21
	.4byte _08052C46 @ case 22
	.4byte _08052C46 @ case 23
	.4byte _08052C46 @ case 24
	.4byte _08052C46 @ case 25
	.4byte _08052C46 @ case 26
	.4byte _08052C46 @ case 27
	.4byte _08052C46 @ case 28
	.4byte _08052C46 @ case 29
	.4byte _08052C46 @ case 30
	.4byte _08052C46 @ case 31
	.4byte _08052C46 @ case 32
	.4byte _08052C20 @ case 33
	.4byte _08052C20 @ case 34
	.4byte _08052C2C @ case 35
	.4byte _08052C30 @ case 36
	.4byte _08052C46 @ case 37
	.4byte _08052C46 @ case 38
	.4byte _08052C46 @ case 39
	.4byte _08052C46 @ case 40
	.4byte _08052C46 @ case 41
	.4byte _08052C46 @ case 42
	.4byte _08052C34 @ case 43
	.4byte _08052C38 @ case 44
	.4byte _08052C3C @ case 45
	.4byte _08052C3C @ case 46
	.4byte _08052C40 @ case 47
	.4byte _08052C40 @ case 48
	.4byte _08052C24 @ case 49
_08052C20:
	movs r2, #4
	b _08052C46
_08052C24:
	movs r2, #5
	b _08052C46
_08052C28:
	movs r2, #0xc
	b _08052C46
_08052C2C:
	movs r2, #6
	b _08052C46
_08052C30:
	movs r2, #0xd
	b _08052C46
_08052C34:
	movs r2, #7
	b _08052C46
_08052C38:
	movs r2, #8
	b _08052C46
_08052C3C:
	movs r2, #9
	b _08052C46
_08052C40:
	movs r2, #0xa
	b _08052C46
_08052C44:
	movs r2, #0xb
_08052C46:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08052C50
sub_08052C50: @ 0x08052C50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08052C76
	movs r0, #0
	strh r0, [r4]
_08052C76:
	ldr r0, _08052C98 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r5
	beq _08052C90
	cmp r2, #0x53
	blt _08052C90
	cmp r2, #0x55
	ble _08052C8C
	cmp r2, #0x57
	bne _08052C90
_08052C8C:
	movs r0, #0
	strh r0, [r4]
_08052C90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052C98: .4byte 0x0203E00C

	thumb_func_start ParseBattleHitToBanimCmd
ParseBattleHitToBanimCmd: @ 0x08052C9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _08052CF4 @ =0x0203A4F0
	mov sb, r0
	movs r2, #0
	ldr r4, _08052CF8 @ =0x0203E036
	ldr r5, _08052CFC @ =0x0203E0A0
	ldr r6, _08052D00 @ =0x0203E02C
	ldr r1, _08052D04 @ =0x0000FFFF
	adds r3, r1, #0
	adds r1, r4, #0
_08052CBA:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _08052CBA
	movs r2, #0
	ldr r0, _08052D08 @ =0x0203E062
	ldr r1, _08052D04 @ =0x0000FFFF
	adds r3, r1, #0
	adds r1, r0, #4
_08052CD2:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _08052CD2
	movs r2, #0
	str r2, [r5, #4]
	str r2, [r5]
	movs r5, #0
	ldrsh r0, [r6, r5]
	cmp r0, #4
	bne _08052D0C
	strh r0, [r4]
	strh r0, [r4, #2]
	b _080531FE
	.align 2, 0
_08052CF4: .4byte 0x0203A4F0
_08052CF8: .4byte 0x0203E036
_08052CFC: .4byte 0x0203E0A0
_08052D00: .4byte 0x0203E02C
_08052D04: .4byte 0x0000FFFF
_08052D08: .4byte 0x0203E062
_08052D0C:
	ldr r1, _08052D20 @ =0x0203A3D8
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08052D24
	movs r0, #6
	strh r0, [r4]
	strh r2, [r4, #2]
	b _080531FE
	.align 2, 0
_08052D20: .4byte 0x0203A3D8
_08052D24:
	ldrh r6, [r6]
	str r6, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, _08052DD4 @ =0x0203E094
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _08052DD8 @ =0x0203E098
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x11
	bne _08052D4C
	cmp r6, #0
	bne _08052D4C
	movs r0, #1
	str r0, [sp, #0x14]
_08052D4C:
	ldr r4, [sp, #8]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIid
	adds r5, r4, #0
	cmp r0, #0x11
	bne _08052D66
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _08052D66
	movs r2, #1
	str r2, [sp, #0x18]
_08052D66:
	ldr r4, [sp, #4]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x28
	bne _08052D7E
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _08052D7E
	movs r1, #1
	str r1, [sp, #0x14]
_08052D7E:
	ldrh r0, [r5]
	bl GetItemIid
	cmp r0, #0x28
	bne _08052D92
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bne _08052D92
	movs r0, #1
	str r0, [sp, #0x18]
_08052D92:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x29
	bne _08052DA6
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne _08052DA6
	movs r2, #1
	str r2, [sp, #0x14]
_08052DA6:
	ldrh r0, [r5]
	bl GetItemIid
	cmp r0, #0x29
	bne _08052DBA
	ldr r5, [sp, #0x18]
	cmp r5, #0
	bne _08052DBA
	movs r0, #1
	str r0, [sp, #0x18]
_08052DBA:
	ldr r2, _08052DDC @ =0x0203E062
	ldr r1, _08052DE0 @ =0x0203E0B8
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	movs r1, #0
	str r1, [sp, #0xc]
	mov r8, r1
	movs r7, #0
	mov r5, sb
	ldrb r1, [r5, #2]
	b _080531F4
	.align 2, 0
_08052DD4: .4byte 0x0203E094
_08052DD8: .4byte 0x0203E098
_08052DDC: .4byte 0x0203E062
_08052DE0: .4byte 0x0203E0B8
_08052DE4:
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, _08052E1C @ =0x0203E014
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _08052E24
	mov r5, sp
	movs r0, #2
	add r0, sp
	mov sl, r0
	ldr r4, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r6, [sp, #4]
	movs r3, #0
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _08052E40
	ldr r0, _08052E20 @ =0x0203E00C
	strh r2, [r0]
	b _08052E40
	.align 2, 0
_08052E1C: .4byte 0x0203E014
_08052E20: .4byte 0x0203E00C
_08052E24:
	mov r5, sp
	adds r5, #2
	mov sl, sp
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x1c]
	ldr r6, [sp, #8]
	movs r3, #0
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bne _08052E40
	ldr r1, _08052E78 @ =0x0203E00C
	movs r0, #1
	strh r0, [r1]
_08052E40:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08052E5C
	ldr r2, _08052E7C @ =0x0203E0A0
	ldr r1, _08052E80 @ =0x0203A3D8
	ldr r0, [r1, #0x10]
	str r0, [r2]
	ldr r0, [r1, #0x14]
	str r0, [r2, #4]
_08052E5C:
	mov r2, sb
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08052E90
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08052E88
	ldr r0, _08052E84 @ =0x081D851C
	b _08052F0A
	.align 2, 0
_08052E78: .4byte 0x0203E00C
_08052E7C: .4byte 0x0203E0A0
_08052E80: .4byte 0x0203A3D8
_08052E84: .4byte 0x081D851C
_08052E88:
	ldr r0, _08052E8C @ =0x081D8544
	b _08052F0A
	.align 2, 0
_08052E8C: .4byte 0x081D8544
_08052E90:
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08052EB8
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08052EB0
	ldr r0, _08052EAC @ =0x081D851C
	b _08052F0A
	.align 2, 0
_08052EAC: .4byte 0x081D851C
_08052EB0:
	ldr r0, _08052EB4 @ =0x081D8544
	b _08052F0A
	.align 2, 0
_08052EB4: .4byte 0x081D8544
_08052EB8:
	lsls r0, r3, #0x10
	cmp r0, #0
	blt _08052EDC
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08052ED4
	ldr r0, _08052ED0 @ =0x081D8508
	b _08052F0A
	.align 2, 0
_08052ED0: .4byte 0x081D8508
_08052ED4:
	ldr r0, _08052ED8 @ =0x081D853A
	b _08052F0A
	.align 2, 0
_08052ED8: .4byte 0x081D853A
_08052EDC:
	movs r0, #2
	bl sub_080672E8
	cmp r0, #1
	beq _08052F00
	cmp r0, #1
	bgt _08052EF0
	cmp r0, #0
	beq _08052EF6
	b _08052F14
_08052EF0:
	cmp r0, #2
	beq _08052F08
	b _08052F14
_08052EF6:
	ldr r0, _08052EFC @ =0x081D854E
	b _08052F0A
	.align 2, 0
_08052EFC: .4byte 0x081D854E
_08052F00:
	ldr r0, _08052F04 @ =0x081D8558
	b _08052F0A
	.align 2, 0
_08052F04: .4byte 0x081D8558
_08052F08:
	ldr r0, _08052F30 @ =0x081D8562
_08052F0A:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
_08052F14:
	movs r0, #2
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08052F50
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08052F38
	ldr r0, _08052F34 @ =0x081D8512
	b _08052F3A
	.align 2, 0
_08052F30: .4byte 0x081D8562
_08052F34: .4byte 0x081D8512
_08052F38:
	ldr r0, _08052F48 @ =0x081D853A
_08052F3A:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
	ldr r0, _08052F4C @ =0x081D8526
	b _08052F52
	.align 2, 0
_08052F48: .4byte 0x081D853A
_08052F4C: .4byte 0x081D8526
_08052F50:
	ldr r0, _08052FD4 @ =0x081D8530
_08052F52:
	ldr r2, [sp, #0x1c]
	lsls r1, r2, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r5, sl
	strh r0, [r5]
	ldr r1, _08052FD8 @ =0x0203E036
	ldr r2, [sp, #0xc]
	lsls r0, r2, #2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	movs r6, #0
	strh r0, [r5]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r4, r0, r1
	mov r1, sp
	ldrh r0, [r1, #2]
	strh r0, [r4]
	mov r2, sb
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08052F8C
	b _080531E6
_08052F8C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08053028
	ldr r0, _08052FDC @ =0x0203E014
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _08052FE8
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08052FB8
	movs r2, #0
_08052FB8:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	ldr r1, _08052FE0 @ =0x0203E062
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, _08052FE4 @ =0xFFFF8000
	adds r0, r2, #0
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	b _080531E6
	.align 2, 0
_08052FD4: .4byte 0x081D8530
_08052FD8: .4byte 0x0203E036
_08052FDC: .4byte 0x0203E014
_08052FE0: .4byte 0x0203E062
_08052FE4: .4byte 0xFFFF8000
_08052FE8:
	mov r2, r8
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	mov r5, sb
	movs r1, #3
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08053004
	movs r2, #0
_08053004:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, _08053020 @ =0x0203E062
	adds r0, r0, r1
	strh r2, [r0]
	ldr r2, _08053024 @ =0xFFFF8000
	b _080531DE
	.align 2, 0
_08053020: .4byte 0x0203E062
_08053024: .4byte 0xFFFF8000
_08053028:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08053110
	ldr r0, _0805309C @ =0x0203E014
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _080530A8
	mov r2, r8
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	mov r5, sb
	movs r1, #3
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0805305C
	movs r2, #0
_0805305C:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _080530A0 @ =0x0203E062
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r2, [r0]
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _080530A4 @ =0x0203E0BC
	lsrs r2, r0, #0x10
	ldrh r5, [r3]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble _08053090
	ldrh r2, [r3]
_08053090:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	b _08053100
	.align 2, 0
_0805309C: .4byte 0x0203E014
_080530A0: .4byte 0x0203E062
_080530A4: .4byte 0x0203E0BC
_080530A8:
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080530C0
	movs r2, #0
_080530C0:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r4, _08053108 @ =0x0203E062
	lsls r0, r7, #2
	adds r0, r0, r4
	strh r2, [r0]
	mov r5, r8
	lsls r0, r5, #1
	adds r0, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _0805310C @ =0x0203E0BC
	lsrs r2, r0, #0x10
	ldrh r5, [r3, #2]
	lsls r1, r5, #0x10
	cmp r0, r1
	ble _080530F0
	ldrh r2, [r3, #2]
_080530F0:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
_08053100:
	adds r0, r0, r4
	strh r2, [r0]
	b _080531E6
	.align 2, 0
_08053108: .4byte 0x0203E062
_0805310C: .4byte 0x0203E0BC
_08053110:
	ldr r0, _08053184 @ =0x0203E014
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _0805318C
	mov r1, r8
	lsls r0, r1, #1
	adds r0, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08053138
	movs r2, #0
_08053138:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, _08053188 @ =0x0203E062
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #0x40
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08053166
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r4]
_08053166:
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080531E6
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r1, #0
	ldrh r2, [r5]
	orrs r0, r2
	strh r0, [r5]
	b _080531E6
	.align 2, 0
_08053184: .4byte 0x0203E014
_08053188: .4byte 0x0203E062
_0805318C:
	lsls r0, r7, #1
	bl GetEfxHp
	mov r2, sb
	movs r1, #3
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080531A4
	movs r2, #0
_080531A4:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #2
	ldr r1, _08053210 @ =0x0203E062
	adds r0, r0, r1
	strh r2, [r0]
	movs r0, #0x40
	mov r2, sb
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080531CA
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	ldrh r2, [r5]
	orrs r0, r2
	strh r0, [r5]
_080531CA:
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r5, #0
	mov r1, sb
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080531E6
	movs r2, #0x80
	lsls r2, r2, #5
_080531DE:
	adds r0, r2, #0
	ldrh r5, [r4]
	orrs r0, r5
	strh r0, [r4]
_080531E6:
	movs r0, #4
	add sb, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	mov r2, sb
	ldrb r1, [r2, #2]
_080531F4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080531FE
	b _08052DE4
_080531FE:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053210: .4byte 0x0203E062

