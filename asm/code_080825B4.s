	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080825B4
sub_080825B4: @ 0x080825B4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	cmp r7, #0
	bne _080825C0
	ldr r7, _08082628 @ =0x06013000
_080825C0:
	cmp r5, #0
	bge _080825C6
	movs r5, #5
_080825C6:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _0808262C @ =0x083FD764
	adds r1, r7, #0
	bl Decompress
	ldr r0, _08082630 @ =0x08403A6C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r7, r2
	bl Decompress
	ldr r6, _08082634 @ =0x0203E6A0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r6, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	bl SetTextFont
	ldr r0, _08082638 @ =0x081946B4
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r4
	lsls r1, r5, #0xc
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082628: .4byte 0x06013000
_0808262C: .4byte 0x083FD764
_08082630: .4byte 0x08403A6C
_08082634: .4byte 0x0203E6A0
_08082638: .4byte 0x081946B4
