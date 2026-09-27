	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080506AC
sub_080506AC: @ 0x080506AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bhs _080506D8
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r1, r0
_080506C0:
	cmp r2, r5
	blo _080506C6
	movs r2, #0
_080506C6:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	blo _080506C0
_080506D8:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
