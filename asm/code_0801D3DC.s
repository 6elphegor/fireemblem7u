	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSomeFacingDirection
GetSomeFacingDirection: @ 0x0801D3DC
	cmp r0, r2
	bne _0801D3F0
	cmp r1, r3
	bge _0801D3E8
	movs r0, #3
	b _0801D402
_0801D3E8:
	cmp r1, r3
	ble _0801D3F0
	movs r0, #2
	b _0801D402
_0801D3F0:
	cmp r1, r3
	bne _0801D400
	cmp r0, r2
	blt _0801D400
	cmp r0, r2
	ble _0801D400
	movs r0, #1
	b _0801D402
_0801D400:
	movs r0, #0
_0801D402:
	bx lr
