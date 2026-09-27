	.include "macro.inc"

	.syntax unified

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
