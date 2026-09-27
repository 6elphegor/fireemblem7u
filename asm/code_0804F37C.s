	.include "macro.inc"

	.syntax unified

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
	bl Proc_Start
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
