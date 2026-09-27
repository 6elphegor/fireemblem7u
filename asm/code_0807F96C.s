	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMuralBackgroundExt
StartMuralBackgroundExt: @ 0x0807F96C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r7, _0807F9A4 @ =0x02024460
	cmp r4, #0
	bne _0807F98E
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_0807F98E:
	cmp r5, #0
	bge _0807F994
	movs r5, #0xe
_0807F994:
	cmp r6, #0
	beq _0807F9AC
	ldr r0, _0807F9A8 @ =0x081C8184
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0807F9B6
	.align 2, 0
_0807F9A4: .4byte 0x02024460
_0807F9A8: .4byte 0x081C8184
_0807F9AC:
	ldr r0, _0807F9F4 @ =0x0841E2D8
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
_0807F9B6:
	ldr r0, _0807F9F8 @ =0x08418E44
	adds r1, r4, #0
	bl Decompress
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r5
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _0807F9FC @ =0x0000027F
_0807F9D6:
	adds r0, r2, r1
	strh r0, [r7]
	adds r7, #2
	adds r2, #1
	cmp r2, r3
	ble _0807F9D6
	ldr r0, _0807FA00 @ =0x08CC1C5C
	mov r1, r8
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807F9F4: .4byte 0x0841E2D8
_0807F9F8: .4byte 0x08418E44
_0807F9FC: .4byte 0x0000027F
_0807FA00: .4byte 0x08CC1C5C
