	.include "macro.inc"

	.syntax unified

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
