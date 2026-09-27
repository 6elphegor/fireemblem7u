	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnkTrapAnim
StartUnkTrapAnim: @ 0x0801EE84
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov r8, r1
	mov sb, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r0, _0801EECC @ =0x083F4464
	ldr r1, _0801EED0 @ =0x06014800
	bl Decompress
	ldr r0, _0801EED4 @ =0x083F46F0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801EED8 @ =0x08B93834
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x58]
	str r6, [r0, #0x5c]
	mov r1, r8
	str r1, [r0, #0x2c]
	mov r1, sb
	str r1, [r0, #0x30]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801EECC: .4byte 0x083F4464
_0801EED0: .4byte 0x06014800
_0801EED4: .4byte 0x083F46F0
_0801EED8: .4byte 0x08B93834
