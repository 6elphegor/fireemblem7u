	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044630
sub_08044630: @ 0x08044630
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	ldr r1, [r4, #0x34]
	subs r1, r2, r1
	ldr r3, [r4, #0x3c]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	movs r3, #0x2c
	ldrsh r2, [r4, r3]
	adds r3, r5, #0
	bl DrawLinkArenaScoreNumber
	ldr r0, [r4, #0x44]
	cmp r0, r5
	beq _0804468A
	adds r1, r4, #0
	adds r1, #0x32
	ldr r0, _080446BC @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r1, [r1]
	ldrb r0, [r0, #6]
	cmp r1, r0
	bne _0804468A
	ldr r0, _080446C0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804468A
	movs r0, #0x80
	bl m4aSongNumStart
_0804468A:
	str r5, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0xa
	bls _080446B2
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, _080446C4 @ =0x0203DC9C
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r4, #0x38]
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080446B2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080446BC: .4byte 0x08B98AEC
_080446C0: .4byte 0x0202BBF8
_080446C4: .4byte 0x0203DC9C
