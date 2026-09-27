	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806FF88
sub_0806FF88: @ 0x0806FF88
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08070018 @ =0x081D97F0
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _0807001C @ =0x06004000
	adds r1, r0, r2
	adds r0, r4, #0
	movs r2, #0xe0
	bl RegisterDataMove
	ldr r4, _08070020 @ =0x081D9AF0
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _08070024 @ =0x060040E0
	adds r1, r0, r2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r4, #0
	bl RegisterDataMove
	ldr r4, _08070028 @ =0x081D9DF0
	movs r0, #0
	bl GetBgChrOffset
	ldr r2, _0807002C @ =0x060043E0
	adds r1, r0, r2
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl RegisterDataMove
	ldr r1, _08070030 @ =0x081D9FBC
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08070034 @ =0x02022E6C
	ldr r1, _08070038 @ =0x083F3F3C
	movs r2, #0xa4
	lsls r2, r2, #7
	bl TmApplyTsa_thm
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #6
	movs r1, #8
	bl sub_0806FF18
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070018: .4byte 0x081D97F0
_0807001C: .4byte 0x06004000
_08070020: .4byte 0x081D9AF0
_08070024: .4byte 0x060040E0
_08070028: .4byte 0x081D9DF0
_0807002C: .4byte 0x060043E0
_08070030: .4byte 0x081D9FBC
_08070034: .4byte 0x02022E6C
_08070038: .4byte 0x083F3F3C
