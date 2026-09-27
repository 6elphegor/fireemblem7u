	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FB3C
sub_0804FB3C: @ 0x0804FB3C
	push {r4, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _0804FB52
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
_0804FB52:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _0804FB60
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
_0804FB60:
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
