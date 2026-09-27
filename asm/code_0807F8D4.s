	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMuralBackgroundAlt
StartMuralBackgroundAlt: @ 0x0807F8D4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r6, _0807F90C @ =0x02024460
	cmp r4, #0
	bne _0807F8EE
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_0807F8EE:
	cmp r5, #0
	bge _0807F8F4
	movs r5, #0xe
_0807F8F4:
	ldr r1, _0807F910 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0807F918
	ldr r0, _0807F914 @ =0x081C8184
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	b _0807F922
	.align 2, 0
_0807F90C: .4byte 0x02024460
_0807F910: .4byte 0x0202BBB8
_0807F914: .4byte 0x081C8184
_0807F918:
	ldr r0, _0807F95C @ =0x0841E2D8
	lsls r1, r5, #5
	movs r2, #0x40
	bl ApplyPaletteExt
_0807F922:
	ldr r0, _0807F960 @ =0x08418E44
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
	ldr r3, _0807F964 @ =0x0000027F
_0807F942:
	adds r0, r2, r1
	strh r0, [r6]
	adds r6, #2
	adds r2, #1
	cmp r2, r3
	ble _0807F942
	ldr r0, _0807F968 @ =0x08CC1C5C
	adds r1, r7, #0
	bl Proc_Start
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807F95C: .4byte 0x0841E2D8
_0807F960: .4byte 0x08418E44
_0807F964: .4byte 0x0000027F
_0807F968: .4byte 0x08CC1C5C
