	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B17A0
sub_080B17A0: @ 0x080B17A0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B1828 @ =0x083F43AC
	ldr r1, _080B182C @ =0x06014C00
	bl Decompress
	ldr r1, _080B1830 @ =0x08CE7280
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xac
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x2c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _080B1834 @ =0x00004260
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B1838 @ =0x081D60F0
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _080B183C @ =0x02022E18
	adds r0, r1, #0
	bl sub_080B1844
	ldr r1, _080B1840 @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1828: .4byte 0x083F43AC
_080B182C: .4byte 0x06014C00
_080B1830: .4byte 0x08CE7280
_080B1834: .4byte 0x00004260
_080B1838: .4byte 0x081D60F0
_080B183C: .4byte 0x02022E18
_080B1840: .4byte 0x02022E16
